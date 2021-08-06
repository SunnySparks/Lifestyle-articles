Rails.application.routes.draw do

  get 'votes/new'
  get 'votes/create'
  get 'votes/destroy'
  get 'articles/index'
  get 'articles/new'
  get 'articles/create'
  get 'articles/show'
  get 'articles/edit'
  get 'articles/update'
  get 'articles/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'categories#index'

  resources :users, only: [:new, :destroy, :create, :show]
  resources :articles, only: [:new, :create, :show, :edit, :update, :destroy] do
    member do
      put "like", to: "articles#upvote"
      put "dislike", to: "articles#downvote"
    end
  end
  resources :categories, only: [:index, :new, :new, :create, :update, :show]

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  
end
