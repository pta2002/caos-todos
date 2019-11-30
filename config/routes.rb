Rails.application.routes.draw do
  root 'sessions#new'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/todos', to: 'todos#index'
  post '/todos/:id/finish', to: 'todos#finish'
  post '/todos/:id/activate', to: 'todos#activate'
  put '/todos', to: 'todos#create'
  delete '/todos/:id', to: 'todos#destroy'
end
