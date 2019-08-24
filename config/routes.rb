Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :posts
  resources :fish ,only: [:index]
  resources :prefectures, only: [:index] do
    resources :cities ,only: [:index] do
      resources :areas ,except: [:destroy]
    end
  end  
  resources :search ,only: [:index]
end
