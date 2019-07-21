Rails.application.routes.draw do
  resources :charts
  root 'charts#index'
end
