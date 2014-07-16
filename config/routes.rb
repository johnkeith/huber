Rails.application.routes.draw do
  root to: "home#index"

  get '/auth/github', as: :create_account
  get '/auth/github/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: :signout
end
