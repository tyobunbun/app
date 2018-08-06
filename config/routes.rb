Rails.application.routes.draw do
  resources :categories
  resources :posts
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :microposts 
  resources :users
  root 'users#index'
end
