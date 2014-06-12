Rails.application.routes.draw do
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
  
  root to: 'merchants#new'
end
