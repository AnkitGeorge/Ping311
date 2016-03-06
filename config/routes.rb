Rails.application.routes.draw do
  # Home directory
  root :to => 'reports#index'
  # Voting routes
  resources :reports do
    member do
      put "like" => "movies#upvote"
    end
  end
  # Restful routes
  resources :sessions
  resources :users
  #Sorcery routes for users to login/logout.
  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout
end
