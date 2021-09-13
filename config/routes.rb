Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  # get 'blogpost/new', to: 'blogpost#new'
  # post 'blogpost', to: 'blogpost#create'
  resources :blogposts
end
