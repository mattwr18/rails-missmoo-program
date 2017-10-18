Rails.application.routes.draw do
  resources :ingredients
  devise_for :users, controllers: { registrations: 'registrations'}
  resources :products
  resources :ingredients
  resources :recipes

  root to: 'static#homepage'

end
