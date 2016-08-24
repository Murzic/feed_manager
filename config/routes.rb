Rails.application.routes.draw do
  root to: "feeds#index"

  resources :feeds, only: [:index, :show, :destroy], shallow: true do
    resources :products, only: [:show]
  end

  namespace :feed do
    resource :imports, only: :create
  end

  scope module: :user do
    get "sign_in", to: "sessions#new"
    post "sign_in", to: "sessions#create"
    delete "sign_out", to: "sessions#destroy"
  end
end
