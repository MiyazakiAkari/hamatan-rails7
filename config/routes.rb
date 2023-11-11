Rails.application.routes.draw do
  devise_for :users
    root 'lectures#home'
    resources :lectures do
        resources :reviews
        resource :likes, only: [:create, :destroy]
    end

  namespace :users do
    get 'profile'
  end
end