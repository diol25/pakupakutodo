Rails.application.routes.draw do
  root to: "tasks#index"
  resources :lists, only: %i(create)
  resources :tasks, only: %i(index create destroy)
end
