Rails.application.routes.draw do
  resources :stories
  resources :top_headlines
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# returns all the headlines from the Top Headlines table
  get '/headlines', to: 'stories#show'

  ### signup ###
  post '/signup', to: 'users#create'

  ### login ###
  post '/login', to: 'sessions#create'
  
  ### ME ###
  get '/me', to: 'users#show'
  
  ### logout ###
  delete '/logout', to: 'sessions#destroy'

  get '/stories', to: 'stories#index'
  
  get '/search_stories/:search', to: 'stories#search_stories'

end
