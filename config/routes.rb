Rails.application.routes.draw do

root 'application#welcome'

devise_for :users, :controllers => { :omniauth_callbacks => "callbacks",
registrations: "registrations"}
  # devise_scope :user do
  #   get 'login', to: 'devise/sessions#new'
  # end
  # devise_scope :user do
  #   get 'signup', to: 'devise/registrations#new'
  # end
  resources :users
  resources :subjects, param: :name
  resources :tutors
  resources :users do
    resources :subjects, only: [:index]
  end
  # match '/users/:id',     to: 'users#show',       via: 'get'




end
