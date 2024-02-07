# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: "", path_names:
    {
      sign_in: "login",
      sign_out: "logout",
      registration: "signup"
    },
    controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations"
    }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :bmi_calculations, only: :show
      resources :exercise_metrics, only: %i[index create update]
      resources :profiles, only: %i[index show update]
    end
  end
end
