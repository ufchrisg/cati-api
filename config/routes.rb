Rails.application.routes.draw do
  resources :white_cards
  resources :black_cards
  resources :packs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
