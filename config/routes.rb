Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'

  devise_for :users
  root to: 'home#index'

  resources :rates, except: %i(new show edit update)
end
