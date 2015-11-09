Rails.application.routes.draw do
  namespace :api do
    resources :posts, only: [:create, :update, :index, :destroy]
  end
  root 'posts#index'
end
