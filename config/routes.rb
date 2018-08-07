Rails.application.routes.draw do
  resources :comments
  resources :categories
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :microposts  do
    resources :comments
  end
  resources :users
  root 'users#index'
end
