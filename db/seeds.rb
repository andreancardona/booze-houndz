require "json"
require "http"
require_relative '../config/environment'


#####ADAPTED FROM YELP API's GITHUB

API_KEY = ENV["API_KEY"]

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"



def search
  count = 0
  all_responses = []

  while count < 1000
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {term: "liquor_store", location: "New York City", limit: 50, offset: count}

    response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)

    all_responses <<response.parse
    count += 50
  end
  all_responses
end


def create_neighborhoods
  yelp_hash = search

  yelp_hash.each do |page|
    parsed_array = page["businesses"]
    parsed_array.each do |attribute|
      ls_zip_code = attribute["location"]["zip_code"]
      Neighborhood.find_or_create_by(name: ls_zip_code)
    end
  end
end

create_neighborhoods


def create_liquor_stores
  yelp_hash = search

  yelp_hash.each do |page|
    parsed_array = page["businesses"]

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
end

create_liquor_stores
