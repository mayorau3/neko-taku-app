Rails.application.routes.draw do
  devise_for :users
  root to: "houses#index"
  resources :houses do
    collection do
      get 'search'
    end
  end
  resources :cats, only: :edit
end
