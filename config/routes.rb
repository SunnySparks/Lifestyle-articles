Rails.application.routes.draw do
  get 'sessions/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end
