Rails.application.routes.draw do
  devise_for :users
  root 'instructions#index'
  resources :instructions do
    resources :steps do
      resource :step_statistic
      get :understand, on: :member
    end
    get :statistic, on: :member
  end

  resource :user
end
