class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:errors] = ["User Name or Password is incorrect. Please try again."]
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

end
