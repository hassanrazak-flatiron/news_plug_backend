class UsersController < ApplicationController


    def create
        new_user = User.create!(user_params)
        session[:user_id] = new_user.id
        render json: new_user, status: :created
    end

    def show
        render json: User.find_by(id: session[:user_id])
    end




    private

    def user_params
        params.permit(:first_name, :last_name,:email,:password, :password_confirmation)
    end
end
