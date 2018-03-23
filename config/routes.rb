Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :runs

  post '/runs/api', to: 'runs#api' 


  root 'runs#index'
end