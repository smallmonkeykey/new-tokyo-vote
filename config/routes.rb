Rails.application.routes.draw do
  root 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  delete '/logout' => 'sessions#destroy'

  resources :events, only: [:show] do
    get 'votes/categories', to: 'votes#categories'
    get 'votes/completions', to: 'votes#completions'
    get 'entries/categories', to: 'entries#categories'
    get 'entries/completions', to: 'entries#completions'

    resources :entries, only: [:new, :create, :index, :show]
    resources :votes, only: [:create]
    resources :rankings, only: [:index]
    resources :comments, only: [:index, :show]
  end

  namespace :admin do
  end
end
