Rails.application.routes.draw do

root 'application#welcome'

devise_for :users, :controllers => { :omniauth_callbacks => "callbacks",
registrations: "registrations"}
  resources :users, only: [:index, :show, :edit]
  resources :subjects
  resources :tutors
  resources :users do
    resources :subjects
      delete  =  'subjects#destroy'
  end
end
