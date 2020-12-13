Rails.application.routes.draw do
  post :customer_token, to: 'customer_token#create'
  resource :customer
  
  resource :cart do
    post :add, on: :member
  end

  resources :products
  resources :orders do
    put :confirm, to: 'orders#confirm', on: :member
  end 

  post :admin_token, to: 'admin_token#create'
  resource :admin
end
