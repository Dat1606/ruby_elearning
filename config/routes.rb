Rails.application.routes.draw do
  get "static_pages/home"
  root "static_pages#home"
  get "/signup",  to: "users#new"
  post "/signup",  to: "users#create"
  get "/login",     to: "sessions#new"
  post "/login",    to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :courses, only: :show
  resources :lessons, only: :show
  resources :vocabularies, only: [:show, :index]
end
