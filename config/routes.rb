Rails.application.routes.draw do
  root :to => 'reports#index'
  resources :reports
  resources :sessions
  resources :users

  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout
end
