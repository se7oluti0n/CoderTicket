Rails.application.routes.draw do
  devise_for :users
  root 'events#index'

  resources :events do
    resources :tickets
    resources :orders
    collection do
    	get 'mine'
    end

    member do
    	get 'publish'
    end
  end

  get "upcoming" => "events#index"
end
