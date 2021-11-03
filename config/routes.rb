Rails.application.routes.draw do
  root 'blogposts#index'
  devise_for :users, controllers: { confirmations: 'confirmations' }
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    # confirmations: 'users/confirmations' }
  resources :blogposts do
    collection do
      get '/meaningful', to: 'blogposts#meaningful'
    end
    get '/blogposts/category', to: 'blogposts#index'
  end
  resources :users

  namespace :admin do
    resources :users
    # resources :blogposts
    # resources :categories
    # namespace :commontator do
    #   resources :comments
    # end
    # root to: 'blogposts#index'
    root to: 'users#index'
  end
end
