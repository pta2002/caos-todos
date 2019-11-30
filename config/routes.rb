Rails.application.routes.draw do
  resources :users
  get 'auth/register', to: 'users#new', as: 'register'
  post 'auth/register', to: 'users#create', as: 'create_user'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/todos', to: 'todos#index'
  post '/todos/:id/finish', to: 'todos#finish'
  post '/todos/:id/activate', to: 'todos#activate'
  put '/todos', to: 'todos#create'
  delete '/todos/:id', to: 'todos#destroy'
end
