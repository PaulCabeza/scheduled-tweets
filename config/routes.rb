Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get "password-reset", to: "passwords#edit"
  patch "password-reset", to: "passwords#update"

  get 'sign_up', to: "registrations#new"
  post 'sign_up', to: 'registrations#create'
  delete 'logout', to: 'sessions#destroy'

  get 'login', to: "sessions#new"
  post 'login', to: 'sessions#create'

  get 'about', to:"home#about"
end
