Rails.application.routes.draw do
  get 'leaderboard/index'
  resources :login
  resources :users
  resources :records
  resources :activities
  resources :leaderboard
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
