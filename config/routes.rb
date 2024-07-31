Rails.application.routes.draw do
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'sauna_visits/create'
  get 'saunas/index'
  get 'saunas/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
