Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show], param: :id
  end 
  root 'pages#hello'
end
