Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :blands  
  resources :users, only: [:show, :new, :create ,:edit ,:update] do
    member do
      get :blands
      get :blandedits
    end
  end

end
