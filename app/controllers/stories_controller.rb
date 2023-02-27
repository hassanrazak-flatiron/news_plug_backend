class StoriesController < ApplicationController

    def index
        render json: Story.all
    end

    def show
        render json: Story.first(10)
    end

    def search_stories
        # binding.break
        render json: Story.where("description like ?", "%" + params[:search] + "%"), each_serializer:StorySerializer

    end
end
