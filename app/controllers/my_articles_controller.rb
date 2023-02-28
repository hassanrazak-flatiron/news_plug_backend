class MyArticlesController < ApplicationController


    def index
        render json: MyArticle.all
    end
    
    def create
        new_article = MyArticle.create!(article_params)
        render json: new_article
    end



    private

    def article_params
        params.permit(:user_id,:story_id,:top_headline_id,:summary)
    end
end
