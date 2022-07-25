Rails.application.routes.draw do
  # post "gastos_deputados/upload", to: "gastos_deputados#upload"

  resources :gastos_deputados, only: [:index, :show] do
    post :upload, on: :collection
  end

  root "gastos_deputados#index"
end
