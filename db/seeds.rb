require "json"
require "http"
require_relative '../config/environment'

# Restaurant.destroy_all
# Style.destroy_all
# RestaurantStyle.destroy_all

#####ADAPTED FROM YELP API's GITHUB

API_KEY = ENV["API_KEY"]

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
# BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path





def search
  url = "#{API_HOST}#{SEARCH_PATH}"
  params = {term: "liquor_store", location: "New York City", limit: 50, offset: 950}
  response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
  response.parse
end

def create_neighborhoods
  yelp_hash = search
  parsed_array = yelp_hash["businesses"]
  parsed_array.each do |attribute|
    ls_zip_code = attribute["location"]["zip_code"]

    Neighborhood.find_or_create_by(name: ls_zip_code)
  end
end

create_neighborhoods


def create_liquor_stores
  yelp_hash = search
  parsed_array = yelp_hash["businesses"]
  parsed_array.each do |attribute|
    neighborhood = Neighborhood.find_by(name:[attribute["location"]["zip_code"]])
    ls_name = attribute["name"]
    ls_image = attribute["image_url"]
    ls_latitude_coordinate = attribute["coordinates"]["latitude"]
    ls_longitude_coordinate = attribute["coordinates"]["longitude"]
    ls_price = attribute["price"]
    ls_address1 = attribute["location"]["address1"]
    ls_address2 = attribute["location"]["address2"]
    ls_city = attribute["location"]["city"]
    ls_state = attribute["location"]["state"]
    ls_zip_code = attribute["location"]["zip_code"]
    ls_display_address = attribute["location"]["display_address"]
    ls_display_phone = attribute["display_phone"]

    LiquorStore.create(neighborhood_id: neighborhood.id, name: ls_name, image: ls_image, latitude_coordinate: ls_latitude_coordinate, longitude_coordinate: ls_longitude_coordinate, price: ls_price, address1: ls_address1, address2: ls_address2, city: ls_city, state: ls_state, zip_code: ls_zip_code, display_address: ls_display_address, display_phone: ls_display_phone)
  end
end

create_liquor_stores

########################John's stuff

# def get_add_page(x)
#   yelp_entries = search(x).map {|k,v| v}
#     #create Restaurant Instances
#   yelp_entries[0].each do |restaurant_hash|
#     if restaurant_hash["name"] != "Primary" && restaurant_hash["name"] != "GunBae"
#       name = restaurant_hash["name"]
#       price = restaurant_hash["price"]
#       address = restaurant_hash["location"]["display_address"][0]
#       rating = restaurant_hash["rating"]
#       restaurant_hash["transactions"].include?("delivery") ? delivery = true : delivery = false
#       phone_number = restaurant_hash["display_phone"]
#       distance = (restaurant_hash["distance"] * 0.00062137).round(2)
#       url = restaurant_hash["url"]
#
#       Restaurant.create(name: name, address: address, rating: rating, delivery?: delivery, phone_number: phone_number, distance: distance, url: url, price: price)
#     end
#   end
#   #create Style Instances
#   categories_from_yelp = []
#   yelp_entries[0].each do |restaurant_hash|
#     if restaurant_hash["name"] != "Primary" && restaurant_hash["name"] != "GunBae"
#       restaurant_hash["categories"].each do |hash_arr|
#         hash_arr.each do |k,v|
#           if k == "title"
#             categories_from_yelp << v
#           end
#         end
#       end
#     end
#   end
#   categories_from_yelp.uniq.each do |category_name|
#     new_category = Style.find_or_create_by(name: category_name)
#   end
#   #create RestaurantStyle Instances
#   yelp_entries[0].each do |restaurant_hash|
#     if restaurant_hash["name"] != "Primary" && restaurant_hash["name"] != "GunBae"
#       relevant_restaurant = Restaurant.find_by(name: restaurant_hash["name"])
#       relevant_styles = []
#       restaurant_hash["categories"].each do |hash_arr|
#         hash_arr.each do |k,v|
#           if k == "title"
#             relevant_styles << Style.find_by(name: v)
#           end
#         end
#       end
#       relevant_styles.each do |style_instance|
#         RestaurantStyle.create(restaurant_id: relevant_restaurant.id, style_id: style_instance.id)
#       end
#     end
#   end
# end
#
# #######
# offset = 0
# 4.times do
#   get_add_page(offset)
#   offset += 51
# end
