Rails.application.routes.draw do
namespace :admin do
  resources :comments
  resources :reports
  resources :users
  resources :votes
  resources :subscriptions
  root to: "reports#index"
  end
  # Home directory
  root :to => 'reports#index'
  # Report routes
  resources :votes, only: [:create, :update, :destroy]
  resources :subscriptions, only: [:create, :destroy, :update]
  resources :reports do
    resources :comments, only: [:show, :create, :destroy]
  end
  # Restful routes
  resources :sessions
  resources :users
  #Sorcery routes for users to login/logout.
  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout
end
