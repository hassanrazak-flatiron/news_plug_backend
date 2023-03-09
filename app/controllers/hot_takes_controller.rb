class HotTakesController < ApplicationController

    # wrap_parameters format: []
    # skip_before_action:authorize, only: :create


    def index
        render json: HotTake.all

    end

    def show
        # binding.break
        # render json: HotTake.where()
    end

    def create
        render json: HotTake.create!(hottake_params)

    end

    ######## custom method ###############

    def saved_takes
        # binding.break
        render json: MyArticle.where(user_id:@current_user)
    end


    

    private

    def hottake_params
        # binding.break
        params.permit(:my_article_id,:title,:summary,:tags)
    end
end
