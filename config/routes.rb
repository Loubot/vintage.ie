Rails.application.routes.draw do
  devise_for :merchants
  
  resources :merchants do
    resources :shops
    resources :photos
  end
  resources :shops do
    resources :items
    resources :photos
  end

  resources :items do
  	resources :photos
  end
  
  root to: 'merchants#edit', as: 'yourdetails'
end
