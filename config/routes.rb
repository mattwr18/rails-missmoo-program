Rails.application.routes.draw do
  resources :ingredients
  devise_for :users, controllers: { registrations: 'registrations'}
  resources :products do
    resources :ingredients
  end
  resources :recipes

  get "/add_fields", to: "products#add_fields"

  root to: 'static#homepage'

end
