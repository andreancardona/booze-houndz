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

      if neighborhood
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

        LiquorStore.find_or_create_by(neighborhood_id: neighborhood.id, name: ls_name, image: ls_image, latitude_coordinate: ls_latitude_coordinate, longitude_coordinate: ls_longitude_coordinate, price: ls_price, address1: ls_address1, address2: ls_address2, city: ls_city, state: ls_state, zip_code: ls_zip_code, display_address: ls_display_address, display_phone: ls_display_phone)
      end

    end
  end
end

create_liquor_stores

User.create(name: "Andrea", password:"AC")
User.create(name: "Anna", password:"AKB")
User.create(name: "Briana", password:"BB")
User.create(name: "Drew", password:"DO")
User.create(name: "John", password:"JE")
User.create(name: "Joseph", password:"JL")
User.create(name: "Julien", password:"JT")
User.create(name: "Kenny", password:"KH")
User.create(name: "Lindsay", password:"LC")
User.create(name: "Mark", password:"MB")
User.create(name: "Matt", password:"MW")
User.create(name: "Mo", password:"MR")
User.create(name: "Nemanja", password:"ND")
User.create(name: "Oleg", password:"OC")
User.create(name: "Tania", password:"TA")
User.create(name: "Johann", password:"JK")
User.create(name: "Rishi", password:"RT")
User.create(name: "Meryl", password:"MD")
User.create(name: "Daniel", password:"DS")
User.create(name: "TerrBear", password:"TK")


Review.create(liquor_store_id: 45, user_id: 1, content: "GREAT!", rating: 5)
Review.create(liquor_store_id: 10, user_id: 2, content: "HELLA WINE", rating: 5)
Review.create(liquor_store_id: 22, user_id: 3, content: "cheap beer", rating: 2)
Review.create(liquor_store_id: 68, user_id: 4, content: "a little sketchy", rating: 2)
Review.create(liquor_store_id: 93, user_id: 5, content: "cheap alcohol - will go again", rating: 3)
Review.create(liquor_store_id: 28, user_id: 6, content: "Great selection!", rating: 4)
Review.create(liquor_store_id: 65, user_id: 7, content: "Owners are so nice!", rating: 5)
Review.create(liquor_store_id: 51, user_id: 8, content: "great wine selection", rating: 1)
Review.create(liquor_store_id: 34, user_id: 9, content: "shitty wine", rating: 2)
Review.create(liquor_store_id: 72, user_id: 10, content: "shitty beer", rating: 3)
Review.create(liquor_store_id: 83, user_id: 11, content: "shitty selection", rating: 4)
Review.create(liquor_store_id: 200, user_id: 12, content: "small, cute, local liquor store", rating: 5)
Review.create(liquor_store_id: 223, user_id: 13, content: "GREAT!", rating: 4)
Review.create(liquor_store_id: 916, user_id: 14, content: "amazing place!", rating: 3)
Review.create(liquor_store_id: 12, user_id: 15, content: "my every day spot!", rating: 2)
Review.create(liquor_store_id: 18, user_id: 16, content: "they know me too well here...", rating: 1)
Review.create(liquor_store_id: 93, user_id: 17, content: "I love this place!", rating: 5)
Review.create(liquor_store_id: 93, user_id: 18, content: "DOPE!", rating: 4)
Review.create(liquor_store_id: 46, user_id: 19, content: "meh!", rating: 3)
Review.create(liquor_store_id: 12, user_id: 20, content: "overpriced!", rating: 1)
Review.create(liquor_store_id: 18, user_id: 21, content: "terrible selection", rating: 1)
Review.create(liquor_store_id: 486, user_id: 2, content: "GREAT!", rating: 5)
Review.create(liquor_store_id: 32, user_id: 3, content: "HELLA WINE", rating: 5)
Review.create(liquor_store_id: 749, user_id: 4, content: "cheap beer", rating: 2)
Review.create(liquor_store_id: 650, user_id: 5, content: "a little sketchy", rating: 2)
Review.create(liquor_store_id: 930, user_id: 6, content: "cheap alcohol - will go again", rating: 3)
Review.create(liquor_store_id: 289, user_id: 7, content: "Great selection!", rating: 4)
Review.create(liquor_store_id: 165, user_id: 8, content: "Owners are so nice!", rating: 5)
Review.create(liquor_store_id: 516, user_id: 9, content: "great wine selection", rating: 1)
Review.create(liquor_store_id: 342, user_id: 10, content: "shitty wine", rating: 2)
Review.create(liquor_store_id: 721, user_id: 11, content: "shitty beer", rating: 3)
Review.create(liquor_store_id: 183, user_id: 12, content: "shitty selection", rating: 4)
Review.create(liquor_store_id: 207, user_id: 13, content: "small, cute, local liquor store", rating: 5)
Review.create(liquor_store_id: 22, user_id: 14, content: "GREAT!", rating: 4)
Review.create(liquor_store_id: 7, user_id: 15, content: "amazing place!", rating: 3)
Review.create(liquor_store_id: 129, user_id: 16, content: "my every day spot!", rating: 2)
Review.create(liquor_store_id: 189, user_id: 17, content: "they know me too well here...", rating: 1)
Review.create(liquor_store_id: 931, user_id: 18, content: "I love this place!", rating: 5)
Review.create(liquor_store_id: 193, user_id: 19, content: "DOPE!", rating: 4)
Review.create(liquor_store_id: 546, user_id: 20, content: "meh!", rating: 3)
Review.create(liquor_store_id: 127, user_id: 21, content: "overpriced!", rating: 1)
Review.create(liquor_store_id: 718, user_id: 1, content: "terrible selection", rating: 1)
Review.create(liquor_store_id: 786, user_id: 3, content: "GREAT!", rating: 5)
Review.create(liquor_store_id: 327, user_id: 4, content: "HELLA WINE", rating: 5)
Review.create(liquor_store_id: 79, user_id: 5, content: "cheap beer", rating: 2)
Review.create(liquor_store_id: 350, user_id: 6, content: "a little sketchy", rating: 2)
Review.create(liquor_store_id: 9, user_id: 7, content: "cheap alcohol - will go again", rating: 3)
Review.create(liquor_store_id: 249, user_id: 8, content: "Great selection!", rating: 4)
Review.create(liquor_store_id: 16, user_id: 9, content: "Owners are so nice!", rating: 5)
Review.create(liquor_store_id: 5, user_id: 10, content: "great wine selection", rating: 1)
Review.create(liquor_store_id: 142, user_id: 11, content: "shitty wine", rating: 2)
Review.create(liquor_store_id: 521, user_id: 12, content: "shitty beer", rating: 3)
Review.create(liquor_store_id: 18, user_id: 13, content: "shitty selection", rating: 4)
Review.create(liquor_store_id: 291, user_id: 14, content: "small, cute, local liquor store", rating: 5)
Review.create(liquor_store_id: 292, user_id: 15, content: "GREAT!", rating: 4)
Review.create(liquor_store_id: 708, user_id: 16, content: "amazing place!", rating: 3)
Review.create(liquor_store_id: 286, user_id: 17, content: "my every day spot!", rating: 2)
Review.create(liquor_store_id: 28, user_id: 18, content: "they know me too well here...", rating: 1)
Review.create(liquor_store_id: 698, user_id: 19, content: "I love this place!", rating: 5)
Review.create(liquor_store_id: 20, user_id: 20, content: "DOPE!", rating: 4)
Review.create(liquor_store_id: 178, user_id: 21, content: "meh!", rating: 3)
Review.create(liquor_store_id: 98, user_id: 1, content: "overpriced!", rating: 1)
Review.create(liquor_store_id: 6, user_id: 3, content: "terrible selection", rating: 1)
