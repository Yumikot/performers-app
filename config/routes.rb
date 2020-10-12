Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show, :edit, :update] 
  root "posts#index"
  resources :posts
  resources :categories, except: [:show]
end
