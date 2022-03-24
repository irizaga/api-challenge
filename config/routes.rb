# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      resources :people
    end
  end

  namespace :api do
    namespace :v1 do
      get 'raffle' => 'raffle#index'
      post 'raffle' => 'raffle#pick'
    end
  end
end
