Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations'}
  resources :products

  root to: 'static#homepage'

end
