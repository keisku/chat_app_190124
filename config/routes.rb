Rails.application.routes.draw do
  get 'rooms/show'
  get 'users' => 'users#index'
  get 'user/:id' => 'users#show'

  devise_for :users, skip: :all
  devise_scope :user do
    get 'login' => 'users/sessions#new', as: :new_user_session
    post 'login' => 'users/sessions#create', as: :user_session
    delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session

    get 'password/new' => 'users#passwords#new', as: :new_user_password
    get 'password/edit' => 'users#passwords#edit', as: :edit_user_password
    patch 'password' => 'users#passwords#update', as: :user_password
    put 'password' => 'users#passwords#update'
    post 'password' => 'users#passwords#create'
    
    get 'current_user/cancel' => 'users/registrations#cancel', as: :cancel_user_registration
    get 'signup' => 'users/registrations#new', as: :new_user_registration
    get 'current_user/edit' => 'users/registrations#edit', as: :edit_user_registration
    patch 'current_user' => 'users/registrations#update', as: :user_registration
    put 'current_user' => 'users/registrations#update'
    delete 'current_user' => 'users/registrations#destroy'
    post 'current_user' => 'users/registrations#create'
  end

  root to: 'home#index'
end