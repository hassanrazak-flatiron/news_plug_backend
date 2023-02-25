Rails.application.routes.draw do
  resources :top_headlines
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# returns all the headlines from the Top Headlines table
  get '/headlines', to: 'top_headlines#index'

  ### signup ###
  post '/signup', to: 'users#create'
end
