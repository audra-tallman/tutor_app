Rails.application.routes.draw do

root 'application#welcome'

devise_for :users, :controllers => {omniauth: "omniauth_callbacks" }, :controllers => {registrations: "registrations"}
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
  resources :users do
    resources :subjects, only: [:show, :index]
  end
  resources :subjects
  resources :tutors
  # match '/users/:id',     to: 'users#show',       via: 'get'




end
