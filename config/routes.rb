Rails.application.routes.draw do
  devise_for :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :clients, only: [:index, :new, :create]
  resources :projects, only: [:create]
  resource :report, only: [:new] do
    post :employee, on: :member
    post :client, on: :member
    post :project, on: :member
  end

  resource :timesheet, only: [:new] do
    post :add_time, on: :member
  end
end
