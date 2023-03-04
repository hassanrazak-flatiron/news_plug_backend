class MyArticlesController < ApplicationController


    def index
        render json: MyArticle.all
    end

    def show
        render json: MyArticle.find_by(id:params[:id])
       
    end

    def create
        # binding.break
        new_article = MyArticle.create!(article_params)
        render json: new_article
    end

    def destroy
        # binding.break
        article = MyArticle.find_by(story_id:params[:id])
        article.destroy
        # head: :no_content
    end

    ### custom route #####

    def saved_articles
        my_articles = MyArticle.where(user_id:@current_user.id)
        render json: my_articles
    end
    



    private

    def article_params
        params.permit(:user_id,:story_id,:top_headline_id,:workflow)
    end


end
