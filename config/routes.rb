Rails.application.routes.draw do
  
  root 'home#index'

  devise_for :users

  devise_scope :user do
    get '/admin', to: 'admin/sessions#new'
    post '/admin', to: 'admin/sessions#create'
  end

  namespace :admin do
    resources :dashboard, only: :index
    resources :concerts, except: :new
  end
end