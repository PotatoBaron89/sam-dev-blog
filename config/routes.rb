Rails.application.routes.draw do
  devise_for :users

  ######
  # Home
  root to: "home#index"
  get 'home/index'
  get 'home/about'

  ######
  # Profile
  get 'profile', to: 'profile#profile_home'
  get 'profile/account'
  get 'profile/settings'
  patch 'profile/update'

  ##################
  ####     Resources
  resources :articles do
    member do
      get 'show_card'
      post 'favourite'
    end
  end

  resources :categories

  # resources :products do
  #   resources :magics, controller: "products/magics"
  #   resources :reviews do
  #     member do
  #       get :review
  #     end
  #   end
  #   resources :comments, module: :products

  resources :comments do
    member do
      post 'archive'
    end
  end

  resources :news_letter_subscriptions

  ######
  # Health Check
  get "up" => "rails/health#show", as: :rails_health_check

end
