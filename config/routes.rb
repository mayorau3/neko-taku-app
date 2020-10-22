Rails.application.routes.draw do
  devise_for :users
  get 'houses/index'
  root to: "houses#index"
end
