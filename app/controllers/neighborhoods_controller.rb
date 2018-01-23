class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.all.sort_by {|n| n.name}
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
  end
end
