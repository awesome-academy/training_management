Rails.application.routes.draw do

  root "static_pages#home"

  devise_for :users

  namespace :admin do
    root "users#index"
    resources :users
    resources :courses, :subjects
  end

  namespace :trainee do
    root "trainees#index"
    resources :users
    resources :courses, :subjects
  end

end
