Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos
  get 'stack' => 'todos#stack'

  root 'todos#index'


end
