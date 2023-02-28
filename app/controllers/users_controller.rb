class UsersController < ApplicationController

    skip_before_action:authorize, only: :create

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




    private

    def user_params
        params.permit(:first_name, :last_name,:email,:password, :password_confirmation)
    end
end
