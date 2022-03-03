Rails.application.routes.draw do
  get 'comments/create'
  get 'likes/create'
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
    resources :coments, only: [:create]
    resources :likes, only: [:create]
  end
end
