Rails.application.routes.draw do
  resources :hikes, only: [:index]


  scope module: 'api' do
    scope module: 'v1' do
      get "/hiking_trails", to: "hikes#index"
    end
  end

end
