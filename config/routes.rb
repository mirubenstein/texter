Rails.application.routes.draw do

  resources :contacts, only: [:new, :create, :show, :index] do
    resources :messages, only: [:new, :create, :show, :index]
  end
end
