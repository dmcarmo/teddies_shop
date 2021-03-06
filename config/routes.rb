Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  get 'carts/:id', to: 'carts#show', as: 'cart'
  delete 'carts/:id', to: 'carts#destroy'

  resources :products


  post 'line_items/:id/add', to: 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/reduce', to: 'line_items#reduce_quantity', as: 'line_item_reduce'
  post 'line_items', to: 'line_items#create'
  get 'line_items/:id', to: 'line_items#show', as: 'line_item'
  delete 'line_items/:id', to: 'line_items#destroy'

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
  resources :orders, only:[:index, :new]

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
