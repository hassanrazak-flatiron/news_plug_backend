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
category = ['business','health','science','technology']

category.each{ |c|
    tophdl = RestClient.get "https://newsapi.org/v2/everything?q=#{c}&apiKey=4a5f31c8ffa748dab1bdf9a6acbf394e"
    tophdl_resp = JSON.parse(tophdl.body)
    
    tophdl_articles = tophdl_resp["articles"]

    tophdl_articles_no_null = tophdl_articles.select{ |a|
        a['title'] !=nil || 
        a['author'] != nil || 
        a['publishedAt'] != nil ||
        a['description'] !=nil || 
        a['url'] != nil || 
        a['urlToImage']!=nil || 
        a['content'] !=nil || 
        a["source"]["name"] !=nil
    }

    tophdl_display = tophdl_articles_no_null[0,2]


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

q = ['ukraine','military','economy','usgovernment','middleeast' ]
n = ['nbcnews.com','cbsnews.com','cnn.com','npr.org','politico.com']

q.each{ |q|
    n.each{ |n|
    # console.log(q+ "--"+n)
    searched_articles = RestClient.get "https://newsapi.org/v2/everything?q=#{q}&domains=#{n}&language=en&sortBy=relevancy&apiKey=4a5f31c8ffa748dab1bdf9a6acbf394e"
    sa = JSON.parse(searched_articles.body)
    
    arts = sa["articles"]

    arts_no_null = arts.select{ |a|
        a['title'] !=nil || 
        a['author'] != nil || 
        a['publishedAt'] != nil ||
        a['description'] !=nil || 
        a['url'] != nil || 
        a['urlToImage']!=nil || 
        a['content'] !=nil || 
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
