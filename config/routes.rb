Rails.application.routes.draw do

  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :stocks, only: [ :show , :new, :create ,:edit,:update ,:destroy] do
    member do
      get :buy
      get :sell
    end
  end
  resources :dividends,only: [ :show , :new, :create ,:edit,:update ,:destroy]
  resources :blands, only: [ :show , :new, :create ,:edit,:update ,:destroy] 
  resources :users, only: [:show, :new, :create ,:edit ,:update] do
    member do
      get :blands
      get :blandedits
    end
  end
end
