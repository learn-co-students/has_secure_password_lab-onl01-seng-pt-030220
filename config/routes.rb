Rails.application.routes.draw do
  get '/login' => 'users#new'
  post '/login' => 'users#create'
  post '/login' => 'sessions#create'

  # get 'users/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
