Rails.application.routes.draw do
  root 'home#index'
  resources :events
  devise_for :users
  get "/admin", to: "home#admin", as: "admin"
  post "/events/subscribe", to: "events#subscribe", as: "subscribe"
  post "/events/unsubscribe", to: "events#unsubscribe", as: "unsubscribe"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
