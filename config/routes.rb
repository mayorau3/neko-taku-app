Rails.application.routes.draw do
  devise_for :users
  root to: "houses#index"
  resources :houses do
    collection do
      get 'search'
    end
    resources :reservations, only: [:new, :create]
  end
  resources :cats, only: [:new, :create]
end
