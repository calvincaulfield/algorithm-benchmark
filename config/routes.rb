Rails.application.routes.draw do
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :runs

  post '/runs/api', to: 'runs#api' 


  root 'categories#index'
end
