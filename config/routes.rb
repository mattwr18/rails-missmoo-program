Rails.application.routes.draw do
  resources :ingredients
  devise_for :users, controllers: { registrations: 'registrations'}
  resources :products
  resources :ingredients 

  root to: 'static#homepage'

end
