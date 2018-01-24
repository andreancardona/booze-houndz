class RelationshipsController < ApplicationController
  before_action :logged_in?

  def create
    @user = User.find(params[:followed_id])
    f_id = @user.id
    u_id = current_user.id
    Relationship.create(follower_id: u_id, followed_id: f_id)
    redirect_to current_user
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    redirect_to current_user
  end
end
