class SessionsController < ApplicationController
  
  skip_before_action:authorize, only: :create
  
  def create
    logged_in = User.find_by(email: params[:email])
    if logged_in&.authenticate(params[:password])
        session[:user_id] = logged_in.id
        render json: logged_in
    else
      render json: {error:["invalid email or password combination"]}, status: :unauthorized
    end
  end

  def show
    render json: @current_user
  end

  def destroy
    session.delete :user_id
    head :no_content
  end

end
