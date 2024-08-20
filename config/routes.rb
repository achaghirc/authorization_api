Rails.application.routes.draw do
  resources :applications
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "applications" => "applications#index"
  
  post "authorize" => "authorization#index"
  
  post "actions" => "actions#create"
  get "actions" => "actions#index"
  
  get "permission" => "permission#index"
  post "permission" => "permission#create"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
