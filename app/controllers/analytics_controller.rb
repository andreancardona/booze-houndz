class AnalyticsController < ApplicationController
  def index
    @liquor_stores = LiquorStore.all
    @neighborhoods = Neighborhood.all
    @relationships = Relationship.all
    @reviews = Review.all
    @users = User.all
  end
end
