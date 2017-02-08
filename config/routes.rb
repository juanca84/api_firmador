require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, only: [:show] do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :personas, only: [:index]
      resources :empresas, only: [:index]
    end
  end
end
