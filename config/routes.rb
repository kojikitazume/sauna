# frozen_string_literal: true

Rails.application.routes.draw do
  # ゲストログイン用のカスタムアクション
  get 'guest_login', to: 'sessions#guest_login', as: 'guest_login'

  # Devise のルーティング
  devise_for :users

  # ルートページ
  root 'saunas#index'

  resource :user, only: [:show, :edit, :update]
  resources :saunas, only: %i[index show new create] do
  resources :sauna_visits, only: [:create]
  resource :bookmark, only: %i[create destroy]
  end
end
