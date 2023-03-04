Rails.application.routes.draw do

  resources :my_articles
  resources :stories
  resources :top_headlines
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

 
  ########## AUTHORIZATION & AUTHENTICATION #################
  ### signup ###
  post '/signup', to: 'users#create'

  ### login ###
  post '/login', to: 'sessions#create'
  
  ### ME ###
  get '/me', to: 'sessions#show'
  
  ### logout ###
  delete '/logout', to: 'sessions#destroy'

########## USERS #################


 ########## TOP-HEADLINES #################
  get '/headlines', to: 'top_headlines#index'

 ########## STORIES #################
  get '/stories', to: 'stories#index'
  
  get '/search_stories/:search', to: 'stories#search_stories'

 ########## MY ARTICLES #################

 get '/saved_articles', to: 'my_articles#saved_articles'

 delete '/my_articles/:id', to: 'my_articles#destroy' 
 

  



end
