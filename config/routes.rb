Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :entries, only: [:new, :create]

  get 'home/index'
  get 'entries/categories', to: 'entries#categories'
  get 'entries/completions', to: 'entries#completions'
end
