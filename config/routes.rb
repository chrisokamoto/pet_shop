Rails.application.routes.draw do
  root 'cachorros#index'

  resources :cachorros
end
