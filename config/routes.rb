Rails.application.routes.draw do
  get 'lists/create'

  root 'top#index'
  resources :tasks, only: %i(index create destroy)
end
