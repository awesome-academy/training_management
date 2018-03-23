Rails.application.routes.draw do

  root "static_pages#home"

  devise_for :users

  #resources :courses
  resources :subjects

  namespace :admin do
    root "admin#index"
    get "trainers", to: "users#index", as: :admin_users_path 
    get "trainers", to: "users#index"
    resources :users
    resources :courses, :subjects
  end

  namespace :trainee do
    root "trainees#index"
    resources :users
    resources :courses, :subjects
  end

end
