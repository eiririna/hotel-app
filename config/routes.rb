# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  devise_for :users

  namespace :admin do
    resources :reviews, only: %i[index update destroy]
    resources :rooms
    resources :reservations
  end

  root 'home#index'

  namespace :api do
    resources :users, only: :show
    get '/users_by_email' => 'users_by_emails#show', as: :users_by_email, format: :json
  end

  resources :rooms do
    resources :reservations, controller: 'rooms/reservations'
  end

  resources :reviews, only: %i[index create]
end
