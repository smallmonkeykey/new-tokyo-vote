Rails.application.routes.draw do
  root 'home#index'

  resources :entries, only: [:new, :create]

  get 'home/index'
  get 'entries/categories', to: 'entries#categories'
  get 'entries/completions', to: 'entries#completions'
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  delete '/logout' => 'sessions#destroy'
end
