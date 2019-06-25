Rails.application.routes.draw do
  root to: 'conversations#index'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :conversations
end
