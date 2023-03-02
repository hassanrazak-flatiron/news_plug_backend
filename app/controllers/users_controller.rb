class UsersController < ApplicationController

    skip_before_action:authorize, only: [:create, :index]

    def index
        render json: User.all
    end


    def create
        # binding.break
        new_user = User.create!(user_params)
        session[:user_id] = new_user.id
        render json: new_user, status: :created
    end

    def show
        # render json: User.find_by(id: session[:user_id])
        render json: @current_user
    end

    # def destroy
    #     User.find_by(id:params[:user_id])
    #     head: no_content
    # end




    private

    def user_params
        params.permit(:first_name, :last_name,:email,:password, :password_confirmation)
    end
end
