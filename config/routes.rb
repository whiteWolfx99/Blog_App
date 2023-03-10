Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create], param: :id do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
  root 'pages#hello'
end
