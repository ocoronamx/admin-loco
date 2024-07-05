# <%= ENV.fetch("db_adapter") %>
set :rails_env, 'production'
set :domain, ENV.fetch('mina_domain')
set :branch, ENV.fetch('mina_branch')
set :user, ENV.fetch('mina_user')
set :port, ENV.fetch('mina_port')
