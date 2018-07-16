Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users

  resources :posts, only: %i(create destroy)
  resources :users, only: %i(show index)
  resources :groups do
    resources :posts, only: %i(create destroy)
    resource :comments, only: %i(create)
  end
  resources :comments, only: %i(create edit update)
  resources :user_groups, only: %i(create destroy)
end
