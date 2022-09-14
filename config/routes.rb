Rails.application.routes.draw do
  root to: "home#top"

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get 'friends/top'
  
  resources :users, only: %i[index new create edit show update destroy]
end
