Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show, :edit, :update] 
  root "posts#index"
  get "search" => "posts#search"

  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  resources :categories, except: [:show]
end
