Rails.application.routes.draw do
  resources :rents
  resources :movies
  devise_for :admins
  root to: 'movies#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
