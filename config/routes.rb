Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "restaurants#index"

  resources :restaurants, only: [:index, :show] do

    collection do 
      get :feeds
      get :ranking
    end 
    
    member do 
      get :dashboard

      post :favourite
      post :unfavourite
      
      post :like
      delete :unlike
    end

    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :create, :index]

  resources :categories, only: :show

  resources :followships, only: [:create, :destroy]

  resources :friendships, only: [:create, :destroy]

  namespace :admin do
  	resources :restaurants
  	resources :categories
  	root "restaurants#index"
  end


end
