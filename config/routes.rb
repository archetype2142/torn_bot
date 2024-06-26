# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  admin_constraint = ->(request) do
    request.env['warden'].authenticate(scope: :user).admin?
  end

  constraints admin_constraint do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")

  devise_scope :user do
    authenticated :user do
      root 'admin/torn_api#index', as: :authenticated_root
    end

    unauthenticated do
      root 'static_pages#homepage', as: :unauthenticated_root
    end
  end

  namespace :admin do
    resources :torn_api, only: :index do
      collection do
        post :fetch_asset
      end
    end

    resources :tracked_assets, only: %i[create destroy]

    root to: 'torn_api#index'
  end
end
