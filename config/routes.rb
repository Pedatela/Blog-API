Rails.application.routes.draw do
  resources :categories
  resources :articles
  resources :users
  mount_devise_token_auth_for 'User', at: 'auth'
  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
