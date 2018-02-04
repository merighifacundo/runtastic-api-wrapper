Rails.application.routes.draw do
  resources :login
  resources :users
  resources :records
  resources :activities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
