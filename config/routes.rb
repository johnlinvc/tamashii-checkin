# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'home#index'
  resources :check_records
  resources :check_points
  resources :machines
  resources :events do
    resources :attendees
  end
end
