Rails.application.routes.draw do
  root to: "feeds#index"

  scope module: :user do
    get "sign_in", to: "sessions#new"
    post "sign_in", to: "sessions#create"
    delete "sign_out", to: "sessions#destroy"
  end
end
