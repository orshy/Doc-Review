Rails.application.routes.draw do
  devise_for :users
  resources :docs do
    resources :reviews
  end
  root 'docs#index'
end
