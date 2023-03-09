class StoriesController < ApplicationController

    skip_before_action:authorize, only: [:index,:search_stories]
    
    def index
        render json: Story.all
    end

    def show
        render json: Story.find(id:params[:id])
    end

    def search_stories
        # binding.break
        render json: Story.where("description like ?", "%" + params[:search] + "%"), each_serializer:StorySerializer

    end
end
