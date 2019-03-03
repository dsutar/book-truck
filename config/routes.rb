Rails.application.routes.draw do
  root to: "static_pages#root"

  namespace :api, defaults: { format: :json } do
    resources :trucks, only: [:create, :index]
    resources :jobs, only: [:create]
  end
end
