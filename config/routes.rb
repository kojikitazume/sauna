Rails.application.routes.draw do
  # ゲストログイン用のカスタムアクション
  get 'guest_login', to: 'sessions#guest_login', as: 'guest_login'

  # Devise のルーティング
  devise_for :users

  # ルートページ
  root 'saunas#index'

  # サウナリソース
  resources :saunas, only: [:index, :show] do
    resources :sauna_visits, only: [:create]
    resource :bookmark, only: [:create, :destroy]
  end
end
