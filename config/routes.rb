Rails.application.routes.draw do
  resources :tenders do
    member do
      post :analyze # Genera la ruta POST /tenders/:id/analyze
    end
  end

  # ... el resto de tus rutas (up, pwa, etc.)
  get "up" => "rails/health#show", as: :rails_health_check
  
  root "tenders#new" 
end