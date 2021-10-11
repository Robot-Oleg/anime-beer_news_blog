Rails.application.routes.draw do
  root 'blogposts#index'
  devise_for :users
  mount Commontator::Engine => '/commontator'
  resources :blogposts do
    collection do
      get '/meaningful', to: 'blogposts#meaningful'
    end
    get '/blogposts/category', to: 'blogposts#index'
  end
  resources :users

  namespace :admin do
    resources :users
    resources :blogposts
    resources :categories

    root to: 'blogposts#index'
  end
end
