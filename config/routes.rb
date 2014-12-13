Rails.application.routes.draw do
  devise_for :users
  root 'instructions#index'
  resources :instructions do
    resources :steps
  end
end
