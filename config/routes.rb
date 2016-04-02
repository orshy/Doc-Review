Rails.application.routes.draw do
  resources :docs
  root 'docs#index'
end
