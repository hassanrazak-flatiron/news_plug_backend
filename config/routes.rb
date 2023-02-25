Rails.application.routes.draw do
  resources :top_headlines
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"
  # get '/hello', to: 'application#hello_world'

  get '/headlines', to: 'top_headlines#index'
end
