Rails.application.routes.draw do
  root to: 'chatroom#home'
  resources :users
  get 'about', to: 'chatroom#about'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'chatroom', to: 'chatroom#index'
  post 'message', to: 'chatroom#create'

  mount ActionCable.server, at: '/cable'
end
