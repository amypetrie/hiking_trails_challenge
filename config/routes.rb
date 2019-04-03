Rails.application.routes.draw do
  resources :hikes, only: [:index]
end
