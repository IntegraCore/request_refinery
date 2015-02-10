RequestRefinery::Engine.routes.draw do
  resources :customers

  resources :permissions

  resources :controller_filters

  resources :roles

  devise_for :users, class_name: "RequestRefinery::User", module: :devise

  # root to:'permissions#index'
end
