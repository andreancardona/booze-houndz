require 'rails_helper'

describe Review do
  before(:each) do
    @user = User.create(name: "Andrea", password: "AC")
    @neighborhood = Neighborhood.create(name: 10033)
    @liquor_store = LiquorStore.create(neighborhood_id: @neighborhood.id, name: "LS", image: "img", latitude_coordinate: "lat", longitude_coordinate: "long", price: "$$", address1: "add1", address2: "add2", city: "NYC", state: "NY", zip_code: "10033")
    @review = Review.create(liquor_store_id: @liquor_store.id, user_id: @user.id, content: "Amazeballs", rating: 4)
    @review2 = Review.create(liquor_store_id: @liquor_store.id, user_id: @user.id, content: "Amazeballs", rating: 0)
    @review3 = Review.create(liquor_store_id: @liquor_store.id, user_id: @user.id, content: "Amazeballs", rating: 7)
    @review4 = Review.create(liquor_store_id: @liquor_store.id, user_id: @user.id, content: "Amazeballs", rating: 2.5)
    @review5 = Review.create(liquor_store_id: 4, user_id: @user.id, content: "Amazeballs", rating: 4)
    @review6 = Review.create(liquor_store_id: @liquor_store.id, user_id: 7, content: "Amazeballs", rating: 4)
  end

  it 'can be created' do
    expect(@review).to be_valid
  end

  it 'rating must be greater than or equal to 1' do
    expect(@review2).to_not be_valid
  end

  it 'rating must be less than or equal to 5' do
    expect(@review3).to_not be_valid
  end

  it 'rating must be an integer' do
    expect(@review4).to_not be_valid
  end

  it 'review must have an existing liquor store' do
    expect(@review5).to_not be_valid
  end

  it 'review must have an existing user' do
    expect(@review6).to_not be_valid
  end
end
