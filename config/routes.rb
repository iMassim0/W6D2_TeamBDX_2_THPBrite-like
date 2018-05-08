Rails.application.routes.draw do

  resources :events
  devise_for :users
  root 'home#index'
  get "/admin", to: "home#admin", as: "admin"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
