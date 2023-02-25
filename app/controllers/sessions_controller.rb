class SessionsController < ApplicationController
  
  def create
    logged_in = User.find_by(email: params[:email])
    if logged_in&.authenticate(params[:password])
        session[:user_id] = logged_in.id
        render json: logged_in
    else
      render json: {error:["invalid email or password combination"]}, status: :unauthorized
    end
  end

  def destroy
  end
end
