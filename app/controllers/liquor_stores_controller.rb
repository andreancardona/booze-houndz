class LiquorStoresController < ApplicationController
  def index
    # if logged_in?
    #   @liquor_stores = current_user.liquor_stores
    # else
      @liquor_stores = LiquorStore.all.sort_by {|ls| ls.name}
    end
  # end

  def show
    @liquor_store = LiquorStore.find(params[:id])
  end
end
