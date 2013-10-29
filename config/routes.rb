JsonApiConsumer::Application.routes.draw do
  resources :transactions
  root 'transactions#new'
  post 'transactions/create'
  get 'transactions/new'

  get 'transactions/consume'
end
