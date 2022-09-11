Rails.application.routes.draw do
  root to: "home#top"

  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  
  resources :users, only: %i[index new create edit show update destroy]
end
