Rails.application.routes.draw do
  
  resources :categories

  resources :introductions
  
  get '/runs/:id', to: 'runs#show', as: 'run'

  post '/runs/api', to: 'runs#api' 

  root 'categories#index'
end
