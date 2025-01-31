Rails.application.routes.draw do
  devise_for :therapists, skip: [:registrations], path: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"

  resources :specialities

  resources :therapists do
    resources :availabilities, except: :show, shallow: true
  end

  namespace :therapists_dashboard do
    resources :dashboard, only: :index
    resources :availabilities, only: [:create, :edit, :update, :destroy]
    resources :appointments, only: [:create, :update, :destroy]
  end

  namespace :admin do
    resources :dashboard, only: :index
    resources :therapists, only: [:new, :create, :edit, :update, :destroy]
    resources :specialities, only: [:new, :create, :edit, :update, :destroy]
    resources :availabilities, only: [:new, :create, :update, :destroy]
    resources :appointments, only: [:create, :update, :destroy]
  end
end
