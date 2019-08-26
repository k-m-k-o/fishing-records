Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "describe#index"
  resources :users, only: [:show]
  resources :posts do
    collection do
      get :cities_select
    end
  end  
  
  resources :fish ,only: [:index] do
    collection do
      get :search_fish
    end
  end  
  resources :prefectures, only: [:index] do
    resources :cities ,only: [:index]
  end
end
