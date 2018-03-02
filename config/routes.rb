Rails.application.routes.draw do

  root "static_pages#home"

  devise_for :users
  resources :courses
  resources :subjects

  namespace :admin do
    root "users#index"
    resources :users
    resources :courses, :subjects
  end

end
