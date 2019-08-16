Rails.application.routes.draw do

root 'application#welcome'

devise_for :users, :controllers => { :omniauth_callbacks => "callbacks",
registrations: "registrations"}
  resources :users, only: [:index, :show, :edit]
  resources :subjects
  resources :tutors
  get '/search' => 'tutors#search', :as => 'search_page'
  resources :users do
    resources :subjects
      delete  =  'subjects#destroy'
  end
end
