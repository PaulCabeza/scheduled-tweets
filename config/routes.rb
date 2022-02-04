Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get 'sign_up', to: "registrations#new"
  post 'sign_up', to: 'registrations#create'
  delete 'logout', to: 'sessions#destroy'

  get 'about', to:"home#about"
end
