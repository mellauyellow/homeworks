Rails.application.routes.draw do
  get 'books', to: 'books#index'

  resources :books, only: [:new, :create, :index, :destroy]
end
