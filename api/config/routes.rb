Rails.application.routes.draw do
  post :customer_token, to: 'customer_token#create'
  resource :customer
  
  resource :cart do
    post :add, on: :member
  end

  resources :products

  resources :orders
end
