# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  namespace :api do
    resources :users, only: :show
    get '/users_by_email' => 'users_by_emails#show', as: :users_by_email, format: :json
  end

  resources :rooms
  resources :reviews

end
