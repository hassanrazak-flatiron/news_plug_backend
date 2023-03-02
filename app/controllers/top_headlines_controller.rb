class TopHeadlinesController < ApplicationController

    skip_before_action:authorize, only: [:create, :index]
    def index
        headlines = TopHeadline.all
        render json: headlines
    end
end
