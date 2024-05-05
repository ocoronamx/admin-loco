#!/bin/bash
printf "setup.sh loaded...\n"
## Command to set needed permissions:
##  sudo chmod +x "$HOME/Workbench/admin-loco/setup.sh"
## Command to run script:
##  source $HOME/Workbench/admin-loco/setup.sh

WORKBENCH="$HOME/Workbench"
APP_PATH="$WORKBENCH/admin-loco"
SCRIPT="$APP_PATH/setup.sh"
REPO='git@github.com:ocoronamx/admin-loco.git'

source $HOME/.zshrc

## Workbench setup #############################################################
# sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \\nlibbz2-dev libreadline-dev libsqlite3-dev curl \\nlibncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
# curl https://pyenv.run | bash
# # Add following content to $HOME/.zshrc =>
# # export PYENV_ROOT="$HOME/.pyenv"
# # [[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# # if command -v pyenv 1>/dev/null 2>&1; then; eval "$(pyenv init -)"; fi;
# # export npm_config_python=/usr/bin/python
# nano $HOME/.zshrc
# source $HOME/.zshrc
# pyenv install 2.7 && pyenv global 2.7


## Remove previous installation #################################################
# nvm use 14 && cd $APP_PATH
# npm uninstall -g node-sass --save ; npm uninstall node-sass --save
# npm uninstall -g yarn --save ; npm uninstall yarn --save
# npm audit fix --force


## Reinstall Application #######################################################
printf "Reinstall application...\n$APP_PATH\n"
cd $WORKBENCH && rm -rf $APP_PATH && git clone $REPO
printf "Open development...\n"
cd admin-loco && git checkout development && nvm use 14
printf "Prepare node and yarn...\n"
npm i --package-lock-only && npm audit fix && npm install node-sass@4.14.1
npm install -g yarn && yarn autoclean --force && yarn
gem install bundler -v 2.4.22 && bundle install
yarn install --check-files



# gemfile
#   gem 'webpacker', '~> 5.4.4'

# package json
#   "@rails/webpacker": "5.4.4",

## TODO: Install Vue.js ################################################################################################
## rm build/config.gypi ; rm app/javascript/vue_components/hello.vue ; rm config/webpack/loaders/vue.js ; rm -rf node_modules ; rm yarn.lock ; rm package-lock.json
# bundle exec rails webpacker:install:vue
# yarn add vue-turbolinks
# yarn install --check-files
