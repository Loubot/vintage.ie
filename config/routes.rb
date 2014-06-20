Rails.application.routes.draw do
  devise_for :merchants, :controllers => { :registrations => 'registrations'}
  
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
  
  root to: 'items#index'
  match "*path" => "items#index", via: [:get, :post]  
end
