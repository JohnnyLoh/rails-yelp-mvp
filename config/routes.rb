Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "controller#action"

  resources :restaurants, except: [ :update, :delete, :edit] do
    resources :reviews, only: [:new, :create ]
  end
end
