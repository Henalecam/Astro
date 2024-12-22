Rails.application.routes.draw do
  # Public routes
  root 'categories#index'

  resources :categories, only: %i[index show] do
    resources :products, only: [:show]
  end

  # Admin routes
  namespace :admin do
    resources :categories, except: [:show]
    resources :products, except: [:show]
    resources :variants, except: [:show]
  end
end
