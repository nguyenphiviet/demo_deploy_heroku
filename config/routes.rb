Rails.application.routes.draw do
  root "home#index"
  get "/contact", to: "home#contact"
  post "/contact", to: "home#send_contact"
  devise_for :users, path: "", path_names: {sign_in: "login",
    sign_out: "logout", sign_up: "signup", edit: "profile"},
    controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :tables
  resources :dishes
  resources :categories
end
