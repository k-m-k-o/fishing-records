Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "describe#index"
  resources :users, only: [:show]
  resources :posts do
    collection do
      get :cities_select
      get :cities_search
      get :find_posts
    end
  end  
  
  resources :fish ,only: [:index] do
    collection do
      get :search_fish
      get :find_fish
    end
  end  
end
