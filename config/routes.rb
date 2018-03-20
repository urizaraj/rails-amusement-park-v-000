Rails.application.routes.draw do
  resources :users

  root 'static#home'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
