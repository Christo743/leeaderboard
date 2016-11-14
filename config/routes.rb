Rails.application.routes.draw do

  root 'access#index'

  resources :player_histories
  resources :player_awards
  resources :awards
  resources :players

  match ':controller(/:action(/:id))', :via => [:get, :post]

end
