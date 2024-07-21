Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root 'products#index'

  resources :products, only: [:index]

  resource :cart, only: [:show] do
    post 'add_product/:product_code', to: 'carts#add_product', as: 'add_product'
  end
end
