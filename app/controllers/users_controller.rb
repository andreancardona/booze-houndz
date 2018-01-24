class UsersController < ApplicationController
  # before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
  # #                                       :following, :followers]
  skip_before_action :authorized, only: [:new, :create, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  # def following
  #   @title = "Following"
  #   @user  = User.find(params[:id])
  #   @users = @user.following.paginate(page: params[:page])
  #   render 'show_follow'
  # end
  #
  # def followers
  #   @title = "Followers"
  #   @user  = User.find(params[:id])
  #   @users = @user.followers.paginate(page: params[:page])
  #   render 'show_follow'
  # end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
