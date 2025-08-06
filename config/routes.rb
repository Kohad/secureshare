Rails.application.routes.draw do
  # get "file_uploads/index"
  # get "file_uploads/new"
  # get "file_uploads/create"
  # get "file_uploads/destroy"
  # get "file_uploads/show"
  # get "dashboard/index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
    resources :file_uploads
    get "/f/:slug", to: "file_uploads#public_show", as: :public_file
  end

  root to: redirect('/users/sign_in')
end
