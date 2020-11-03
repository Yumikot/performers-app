Rails.application.routes.draw do
  root'top#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :contacts
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:index, :show, :edit, :update] 
  resource :mypages
  
  get "search" => "posts#search"

  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  resources :categories, except: [:show]
end
