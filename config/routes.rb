Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:index, :show, :edit, :update] 
  resource :mypages
  root "posts#index"
  get "search" => "posts#search"

  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  resources :categories, except: [:show]
end
