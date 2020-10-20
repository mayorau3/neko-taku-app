Rails.application.routes.draw do
  get 'houses/index'
  root to: "houses#index"
end
