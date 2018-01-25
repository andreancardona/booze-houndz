class AnalyticsController < ApplicationController
  def index
    @liquor_stores = LiquorStore.all
    @neighborhoods = Neighborhood.all
    @relationships = Relationship.all
    @reviews = Review.all
    @users = User.all

    ## LS methods
    @most_reviewed_ls = @liquor_stores.sort_by {|ls| ls.reviews.length}.last
    @highest_rated_ls = @liquor_stores.sort_by {|ls| ls.average_rating}.last

    ## ZC methods
    @zc_with_most_ls = @neighborhoods.sort_by {|n| n.liquor_stores.length}.last

    ## User methods
    @user_with_most_reviews = @users.sort_by {|u| u.reviews.length}.last

  end
end
