Rails.application.routes.draw do
  resources :product_sales
  resources :sales
  resources :products
  resources :sellers
  resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
