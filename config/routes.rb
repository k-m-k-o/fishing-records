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

get "fish/search_fish" => "fish#search_fish"
get "fish/fihd_fish" => "fish#fihd_fish"

  resources :areas ,except: [:destroy] do
    resources :comments ,only: [:create]
    collection do
      get :find_areas
      get :search_areas
      get :area_cities
    end
  end
end
