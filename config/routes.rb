Rails.application.routes.draw do
  get 'tasks/index'

  get 'tasks/create'

  get 'tasks/destroy'

  get 'lists/create'

  root 'top#index'
  resources :tasks, only: %i(index create destroy)
end
