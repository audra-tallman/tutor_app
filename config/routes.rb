Rails.application.routes.draw do
  resources :tutors
  resources :users do
    resources :subjects, only: [:show, :index]
  end
  resources :subjects
  match '/users/:id',     to: 'users#show',       via: 'get'
  devise_for :users, :controllers => {registrations: "registrations"}
    devise_scope :user do
      get 'login', to: 'devise/sessions#new'
    end
    devise_scope :user do
      get 'signup', to: 'devise/registrations#new'
    end

root 'application#welcome'

end
