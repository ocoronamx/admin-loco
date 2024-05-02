Rails.application.routes.draw do

  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  # D e m o s
  get 'demos/index', to: 'demos#index', as: 'demo_index'
  get 'demos/form', to: 'demos#form', as: 'demo_form'
  get 'demos/show', to: 'demos#show', as: 'demo_show'
  get 'demos/notices', to: 'demos#notices', as: 'demo_notices'
  get 'demos/landing', to: 'demos#landing', as: 'demo_landing'
  get 'demos/login', to: 'demos#login', as: 'demo_login'

end
