# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
      resources :prescriptions
      resources :categories
      resources :appointments
      resources :doctors
      resources :users
      resources :admin_users

      root to: "admin_users#index"
    end
  get 'admin_users/index'
  get 'admin_users/show'
  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    passwords: 'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :doctors, controllers: {
    sessions: 'doctors/sessions',
    passwords: 'doctors/passwords',
    registrations: 'doctors/registrations'
  }

  resources :users
  resources :doctors
  resources :appointments
  resources :prescriptions
  resources :admin_users
  

  unauthenticated do
    root "home#index"
  end

  authenticated :doctor do
    root 'doctors#index', as: :authenticated_doctor_root
  end

  authenticated :user do
    root 'users#index', as: :authenticated_user_root
  end

  authenticated :admin_user do
    root 'admin_users#index', as: :authenticated_admin_user_root
  end
end
