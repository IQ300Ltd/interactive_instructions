Rails.application.routes.draw do
  devise_for :users
  root 'instructions#index'
  resources :instructions do
    resources :steps do
      resource :step_statistic
    end
  end

  resource :user
end
