Rails.application.routes.draw do
  resources :reviews
  resources :genres
  resources :lists
  resources :mangas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
