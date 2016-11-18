Rails.application.routes.draw do
  devise_for :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :clients, only: [:index, :new, :create]
  resources :projects, only: [:create]
  resource :timesheet, only: [:new] do
    post :add_time, on: :member
  end
end
