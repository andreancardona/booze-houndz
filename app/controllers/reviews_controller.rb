class ReviewsController < ApplicationController
  before_action :logged_in?

  def new
    @review = Review.new
    @liquor_store = LiquorStore.find(params[:liquor_store])
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    @liquor_store = @review.liquor_store
    redirect_to liquor_store_path(@liquor_store)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating, :liquor_store_id)
  end

end
