# config/routes.rb

Rails.application.routes.draw do
  # The route for the dashboard
  get 'dashboard', to: 'dashboard#index'
  
  # The route for job index and search pages
  resources :jobs, only: [:index, :show] do
    collection do
      get 'search'
    end
  end

  # Devise routes
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Setting the root route to jobs index action
  root 'jobs#index'

  # route for displaying individual job details due to dynamic API, not DB API
  get 'jobs/details', to: 'jobs#details'

end
