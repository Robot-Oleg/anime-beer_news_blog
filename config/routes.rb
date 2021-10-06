Rails.application.routes.draw do
  root 'blogposts#index'
  devise_for :users
  resources :blogposts do
    collection do
      get '/meaningful', to: 'blogposts#meaningful'
    end
    resources :comments

    get '/blogposts/category', to: 'blogposts#index'
  end

  resources :comments do
    resources :comments
  end
  resources :users

  namespace :admin do
    resources :users
    resources :comments
    resources :blogposts
    resources :categories

     root to: 'blogposts#index'
  end
end
