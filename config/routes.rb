Rails.application.routes.draw do

  resources :contacts, only: [:new, :create, :show, :index]
  resources :messages, only: [:new, :create, :show, :index]

  match('/inbound_messages', {via: :post, to: 'replies#create', as: :inbound_messages})
end
