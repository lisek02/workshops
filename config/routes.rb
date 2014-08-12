Rails.application.routes.draw do
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  root 'categories#index'
  #get '/categories/:category_id/products', to: 'products#index'
  devise_for :users
end
