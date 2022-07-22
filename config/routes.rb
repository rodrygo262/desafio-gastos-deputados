Rails.application.routes.draw do
  post "gastos_deputados/upload", to: "gastos_deputados#upload"

  resources :gastos_deputados, only: [:index, :show]

  root "gastos_deputados#index"
end
