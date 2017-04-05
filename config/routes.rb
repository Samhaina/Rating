Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'player_ratings/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'player_ratings#index'
end
