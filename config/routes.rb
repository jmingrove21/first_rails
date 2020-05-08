Rails.application.routes.draw do
  devise_for :models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index"
  get "/pokemon" => "pokemon#index"
  get "/pokemon/volt" => "pokemon#volt"
  post "/pokemon/speed" => "pokemon#speed"

  resources :posts
end
