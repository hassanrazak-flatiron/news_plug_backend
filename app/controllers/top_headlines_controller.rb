class TopHeadlinesController < ApplicationController

    def index
        headlines = TopHeadline.all
        render json:headlines
    end
end
