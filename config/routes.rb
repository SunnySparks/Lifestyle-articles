Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  get 'categories/create'
  get 'categories/show'
  get 'categories/update'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'sessions/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'categories#index'

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end
