Rails.application.routes.draw do
  devise_for :users
  root 'saunas#index'
  
  resources :saunas, only: [:index, :show] do
    resources :sauna_visits, only: [:create]
    resource :bookmark, only: [:create, :destroy]
  end
end
