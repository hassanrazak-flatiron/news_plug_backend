Rails.application.routes.draw do
  resources :my_articles
  resources :stories
  resources :top_headlines
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/my_articles', to:'my_articles#index'
  
# returns all the headlines from the Top Headlines table
  get '/headlines', to: 'top_headlines#index'

  ### signup ###
  post '/signup', to: 'users#create'

  ### login ###
  post '/login', to: 'sessions#create'
  
  ### ME ###
  get '/me', to: 'sessions#show'
  
  ### logout ###
  delete '/logout', to: 'sessions#destroy'

  get '/stories', to: 'stories#index'
  
  get '/search_stories/:search', to: 'stories#search_stories'


  post '/savedarticles', to: 'my_articles#create'

end
