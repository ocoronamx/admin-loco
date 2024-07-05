# Basic settings:
set :rails_env, 'development'
set :domain, ENV.fetch('mina_domain') # The hostname to SSH to.
set :branch, ENV.fetch('mina_branch') # Branch name to deploy. (needed by mina/git)
set :user, ENV.fetch('mina_user')
set :port, ENV.fetch('mina_port')

# Optional settings:
#
#   set :forward_agent, true     # SSH forward_agent.
#
#   <%= ENV.fetch("db_adapter") %>
