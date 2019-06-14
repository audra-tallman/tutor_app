Rails.application.routes.draw do
  resources :tutors
  resources :users do
    resources :subjects, only: [:show, :index]
  end
  resources :subjects
  match '/users/:id',     to: 'users#show',       via: 'get'
  devise_for :users, :controllers => {registrations: "registrations"}, :path_prefix => 'id'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'application#welcome'

end
