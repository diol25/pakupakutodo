Rails.application.routes.draw do
  root 'top#index'
  resources :tasks, only: %i(index create destroy)
end
