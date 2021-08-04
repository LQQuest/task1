Rails.application.routes.draw do
  root to: 'items#show'
  get 'show_json', to: 'items#show_json'
  resources :items
end
