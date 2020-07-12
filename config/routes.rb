Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index"
  get "/pokemon" => "pokemon#index"
  get "/pokemon/volt" => "pokemon#volt"
  post "/pokemon/speed" => "pokemon#speed"

  # get "/posts/my" => "posts#my"
  
  resources :posts do
    collection do
      get :my
    end
    member do  
    end
    resources :like do
      collection do
        get :check
      end
    end
  end

  resources :comments

  resources :instagram do
    collection do
      get :check
      get :check_follow
    end
  end
 
end
