Rails.application.routes.draw do

  get '' => 'home#index'
  get '/about' => 'home#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  resources :users, only: [:show, :edit, :update]

  resources :searches do
    collection do
      get :result
    end
  end

  resources :watches
  resources :sound_categories
  resources :sound_moods

  resources :sounds do
    collection do
      post :confirm
    end
  end

  resources :artists

  resources :auctions do
    collection do
      get :confirm
    end
  end

  resources :purchases do
    collection do
      get :confirm

    end
    member do
      post :download
    end
  end

  resources :follows, only: [:index, :create, :destroy]

  resources :watches, only: [:create, :destroy]

end
