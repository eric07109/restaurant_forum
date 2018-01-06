Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "restaurants#index"

  resources :restaurants, only: [:index, :show] do

    collection do 
      get :feeds
    end 
    
    member do 
      get :dashboard
      post :favourite
      post :unfavourite
    end

    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :create]

  resources :categories, only: :show

  namespace :admin do
  	resources :restaurants
  	resources :categories
  	root "restaurants#index"
  end


end
