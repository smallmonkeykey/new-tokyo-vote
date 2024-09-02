Rails.application.routes.draw do
  root 'home#index'

  get 'home/index'
  get 'votes/categories', to: 'votes#categories'
  get 'votes/completions', to: 'votes#completions'
  get 'entries/categories', to: 'entries#categories'
  get 'entries/completions', to: 'entries#completions'
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  delete '/logout' => 'sessions#destroy'

  resources :entries, only: [:new, :create, :index, :show]
  resources :votes, only: [:create]
  resources :ranking, only: [:index]
end
