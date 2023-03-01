Rails.application.routes.draw do
  resources :posts
  resources :users
  root 'pages#hello'
end
