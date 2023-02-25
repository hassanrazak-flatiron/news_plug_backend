# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'rest-client'
require 'json'
# require "awesome_print"

puts "Seeding Headlines..."
headlines = RestClient.get 'https://newsapi.org/v2/top-headlines?country=us&apiKey=4a5f31c8ffa748dab1bdf9a6acbf394e'

hdls = JSON.parse(headlines.body)

puts articles = hdls["articles"]



articles.each { |a|
TopHeadline.create(
    title:a["title"],
    author:a["author"],
    date:a["publishedAt"],
    source:a["source"]["name"],
    description:a["description"],
    url:a["url"],
    img_url:a["urlToImage"],
    content:a["content"]
    )

} 

puts "Headlines created."
