Rails.application.routes.draw do
  devise_for :users
    root 'lectures#home'
    resources :lectures do
      member do
        resources :reviews
      end
    end

  namespace :users do
    get 'profile'
  end
end