Rails.application.routes.draw do
  resources :charts, only: [:index] do
    collection do
      get 'puc_count'
      post 'puc_count'
    end
  end

  root 'charts#puc_count'
end
