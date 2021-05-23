Rails.application.routes.draw do
  root'top#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :contacts
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  resources :users, only: [:index, :show, :edit, :update] 
  resource :mypages
  
  get "search" => "posts#search"

  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  resources :categories, except: [:show]
end
