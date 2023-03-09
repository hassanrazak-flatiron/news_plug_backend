class HotTakesController < ApplicationController

    # wrap_parameters format: []
    # skip_before_action:authorize, only: :create


    def index
        render json: HotTake.all

    end

    def show
        binding.break
        # render json: HotTake.where()
    end

    def create
        render json: HotTake.create!(hottake_params)

    end

    

    private

    def hottake_params
        # binding.break
        params.permit(:my_article_id,:title,:summary,:tags)
    end
end
