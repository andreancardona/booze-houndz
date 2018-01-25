class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception

   before_action :authorized
   helper_method :logged_in?, :current_user, :current_user?

   def current_user
     if session[:user_id]
       @user = User.find_by(id: session[:user_id])
     end
   end

   def current_user?(user)
     current_user.id == user.id
   end

   def logged_in?
     !!current_user
   end

  def authorized
    redirect_to login_path unless logged_in?
  end
end
