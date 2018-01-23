class LiquorStoresController < ApplicationController
  def index
    @liquor_stores = LiquorStore.all.sort_by {|ls| ls.name}
  end

  def show
    @liquor_store = LiquorStore.find(params[:id])
  end
end
