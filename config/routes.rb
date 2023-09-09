# config/routes.rb

Rails.application.routes.draw do

  # This line defines the new route for the dashboard
  get 'dashboard', to: 'dashboard#index'

  # The route for job index page here
  resources :jobs, only: [:index]

  # The route for Searches here
  resources :searches, only: [:index]

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'searches#index'

end

