Rails.application.routes.draw do
  
  get '/categories', to: 'categories#index'
  get '/categories/new', to: 'categories#new'
  post '/categories', to: 'categories#create'

  get '/categories/:id', to: 'categories#show', as: 'category'
  get '/categories/:id/edit', to: 'categories#edit', as: 'edit_category'

  get '/runs/:id', to: 'runs#show', as: 'run'

  post '/runs/api', to: 'runs#api' 

  root 'categories#index'
end
