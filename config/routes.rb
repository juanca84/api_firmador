require 'api_constraints'

Rails.application.routes.draw do
  root to: 'documentos#index'
  resources :documentos, only: [:index, :show]
  namespace :api, defaults: { format: :json }, only: [:show] do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :personas, only: [:index]
      resources :empresas, only: [:index]
      resources :documentos, only: [:update]
    end
  end
end
