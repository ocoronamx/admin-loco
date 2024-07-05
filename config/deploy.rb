# frozen_string_literal: true
set :stages,        %w(development production)
set :default_stage, 'development'
set :stages_dir,    'config/deploy'

require 'mina/rails'
require 'mina/git'
require 'mina/multistage'
require 'mina/bundler'
require 'mina/puma'
require 'mina/rvm'    # for rvm support. (https://rvm.io)

# Basic settings:
set :application_name,  ENV.fetch('mina_app')
set :deploy_to,         ENV.fetch('mina_deploy_to') # Path to deploy into.
set :repository,        ENV.fetch('mina_repository') # Git repo to clone from. (needed by mina/git)
set :ruby_version,      ENV.fetch('ruby_version')
set :current,           "#{fetch(:deploy_to)}/current"
set :shared,            "#{fetch(:deploy_to)}/shared"
set :rvm_use_path,      "#{ENV.fetch('mina_rvm_path')}"

require_relative  'deploy/tasks/tools'

# Shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
# Some plugins already add folders to shared_dirs like `mina/rails` add `public/assets`, `vendor/bundle` and many more
# run `mina -d` to see all folders and files already included in `shared_dirs` and `shared_files`
# set :shared_dirs, fetch(:shared_dirs, []).push('public/assets')
# set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml')
set :shared_dirs, fetch(:shared_dirs, []).push('log', 'tmp/pids', 'tmp/sockets')
set :shared_files, fetch(:shared_files, []).push('config/application.yml')

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :remote_environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  invoke :'rvm:use', "ruby-#{fetch(:ruby_version)}@#{fetch(:application_name)}"
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  command %{rvm install ruby-#{fetch(:ruby_version)}}
  command %{gem install bundler}
  mkdir_shared('config','log','tmp', 'tmp/pids', 'tmp/cache', 'tmp/sockets')
  touch_shared('config/application.yml','tmp/pids/puma.pid', 'tmp/sockets/puma.state', 'tmp/sockets/puma.sock')
  invoke :add_known_host
end

desc 'Deploys the current version to the server.'
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'
    fetch(:ruby_version)
    on :launch do
      in_path(fetch(:current)) do
        command %(mkdir -p tmp/)
        command %(touch tmp/restart.txt)
      end
    end
  end

  # you can use `run :local` to run tasks on local machine before or after the deploy scripts
  # run(:local){ say 'done' }
end

task :add_known_host do
  if fetch(:repository)
    repo_host = fetch(:repository).split(%r{@|://}).last.split(%r{:|\/}).first
    repo_port = /:([0-9]+)/.match(fetch(:repository)) && /:([0-9]+)/.match(fetch(:repository))[1] || '22'
    command %[  if ! ssh-keygen -H  -F #{repo_host} &>/dev/null; then
                  ssh-keyscan -t rsa -p #{repo_port} -H #{repo_host} >> $HOME/.ssh/known_hosts
                fi ]
  end
end
# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
