class ReviewsController < ApplicationController
  before_action :logged_in?

  def new
    @review = Review.new
    @liquor_store = LiquorStore.find(params[:liquor_store])
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @liquor_store = @review.liquor_store
    if @review.valid?
      @review.save
      redirect_to liquor_store_path(@liquor_store)
    else
      flash[:errors] = ["Please enter a whole number between 1 and 5."]
      redirect_to reviews_new_path(liquor_store: @liquor_store)
    end
  end

  def edit
    @review = Review.find(params[:review])
    @liquor_store = LiquorStore.find(params[:liquor_store])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      @user = @review.user
      redirect_to @user
    else
      flash[:errors] = ["Please enter a whole number between 1 and 5."]
      redirect_to reviews_edit_path(review: @review, liquor_store: @review.liquor_store)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @user
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating, :liquor_store_id)
  end

end
