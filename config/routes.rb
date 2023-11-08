Rails.application.routes.draw do
  devise_for :users
    root 'lectures#home'
    resources :lectures do
        resources :reviews
    end

  namespace :users do
    get 'profile'
  end
end