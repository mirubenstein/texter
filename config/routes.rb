Rails.application.routes.draw do

  resources :contacts, only: [:new, :create, :show, :index] do
    resources :messages, only: [:new, :create, :show, :index]
  end

  match('/inbound_messages', {via: :post, to: 'replies#create', as: :inbound_messages})
end
