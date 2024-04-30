Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/home/test', to: 'home#test', as: 'home_test'
end
