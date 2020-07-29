Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users, only: [:new, :create]

get '/signup', to: 'users#new'
get '/login', to: 'sessions#new'

# get '/home', to: 'welcome#home', as: 'welcome'
root 'welcome#home'

post '/signup', to: 'users#create'
post '/login', to: 'sessions#create' 

post '/logout', to: 'sessions#destroy'

end
