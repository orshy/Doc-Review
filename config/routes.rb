Rails.application.routes.draw do
  devise_for :users
  resources :docs
  root 'docs#index'
end
