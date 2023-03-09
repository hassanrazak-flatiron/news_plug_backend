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

# TopHeadline.destroy_all
# Story.destroy_all

puts "Seeding users"

User.create(
    first_name:"Hassan",
    last_name:"Razak",
    email:"hr@1.com",
    password:"123",
    password_confirmation:"123"
    )

puts "Seeding Headlines..."
category = ['putin','biden','federalreserve','wallstreet']

category.each{ |c|
    tophdl = RestClient.get "https://newsapi.org/v2/everything?q=#{c}&apiKey=4a5f31c8ffa748dab1bdf9a6acbf394e"
    tophdl_resp = JSON.parse(tophdl.body)
    
    tophdl_articles = tophdl_resp["articles"]

    tophdl_articles_no_null = tophdl_articles.select{ |a|
        a['title'] !=nil && 
        a['author'] != nil && 
        a['publishedAt'] != nil &&
        a['description'] !=nil && 
        a['url'] != nil && 
        a['urlToImage']!=nil && 
        a['content'] !=nil && 
        a["source"]["name"] !=nil
    }

    tophdl_display = tophdl_articles_no_null[3,10]


    tophdl_display.each { |a|
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
}


puts "Headlines Created......."

puts "Seeding Stories..."

q = ['putin','biden','wallstreet','election','civil' ]
n = ['cbsnews.com','cnn.com','npr.org','politico.com','alternet.org','commondreams.org']

q.each{ |q|
    n.each{ |n|
    # console.log(q+ "--"+n)
    searched_articles = RestClient.get "https://newsapi.org/v2/everything?q=#{q}&domains=#{n}&language=en&sortBy=relevancy&apiKey=4a5f31c8ffa748dab1bdf9a6acbf394e"
    sa = JSON.parse(searched_articles.body)
    
    arts = sa["articles"]

    arts_no_null = arts.select{ |a|
        a['title'] !=nil && 
        a['author'] != nil && 
        a['publishedAt'] != nil &&
        a['description'] !=nil && 
        a['url'] != nil && 
        a['urlToImage']!=nil && 
        a['content'] !=nil && 
        a["source"]["name"] !=nil
    }

    arts10 = arts_no_null[0,9]


    arts10.each { |a|
    Story.create(
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
    }
}


puts "Stories created."


