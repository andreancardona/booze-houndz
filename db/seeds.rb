require "json"
require "http"
require_relative '../config/environment'


#####ADAPTED FROM YELP API's GITHUB

API_KEY = ENV["API_KEY"]

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"

ZIP_ARRAY =
  [{"Bronx"=> [
    {"Central Bronx"=>["10453", "10457", "10460"]},
    {"Bronx Park and Fordham"=>["10458", "10467", "10468"]},
    {"High Bridge and Morrisania"=>["10451", "10452", "10456"]},
    {"Hunts Point and Mott Haven"=>["10454", "10455", "10459", "10474"]},
    {"Kingsbridge and Riverdale"=>["10463", "10471"]},
    {"Northeast Bronx"=>["10466", "10469", "10470", "10475"]},
    {"Southeast Bronx"=>["10461", "10462", "10464", "10465", "10472", "10473"]}]},

  {"Brooklyn"=> [
    {"Central Brooklyn"=>["11212", "11213", "11216", "11233", "11238"]},
    {"Southwest Brooklyn"=>["11209", "11214", "11228"]},
    {"Borough Park"=>["11204", "11218", "11219", "11230"]},
    {"Canarsie and Flatlands"=>["11234", "11236", "11239"]},
    {"Southern Brooklyn"=>["11223", "11224", "11229", "11235"]},
    {"Northwest Brooklyn"=>["11201", "11205", "11215", "11217", "11231"]},
    {"Flatbush"=>["11203", "11210", "11225", "11226"]},
    {"East New York and New Lots"=>["11207", "11208"]},
    {"Greenpoint"=>["11211", "11222"]},
    {"Sunset Park"=>["11220", "11232"]},
    {"Bushwick and Williamsburg"=>["11206", "11221", "11237"]}]},

  {"Manhattan"=> [
    {"Central Harlem"=>["10026", "10027", "10030", "10037", "10039"]},
    {"Chelsea and Clinton"=>["10001", "10011", "10018", "10019", "10020", "10036"]},
    {"East Harlem"=>["10029", "10035"]},
    {"Gramercy Park and Murray Hill"=>["10010", "10016", "10017", "10022"]},
    {"Greenwich Village and Soho"=>["10012", "10013", "10014"]},
    {"Lower Manhattan"=>["10004", "10005", "10006", "10007", "10038", "10280"]},
    {"Lower East Side"=>["10002", "10003", "10009"]},
    {"Upper East Side"=>["10021", "10028", "10044", "10065", "10075", "10128"]},
    {"Upper West Side"=>["10023", "10024", "10025"]},
    {"Inwood and Washington Heights"=>["10031", "10032", "10033", "10034", "10040"]}]},

  {"Queens"=> [
    {"Northeast Queens"=>["11361", "11362", "11363", "11364"]},
    {"North Queens"=>["11354", "11355", "11356", "11357", "11358", "11359", "11360"]},
    {"Central Queens"=>["11365", "11366", "11367"]},
    {"Jamaica"=>["11412", "11423", "11432", "11433", "11434", "11435", "11436"]},
    {"Northwest Queens"=>["11101", "11102", "11103", "11104", "11105", "11106"]},
    {"West Central Queens"=>["11374", "11375", "11379", "11385"]},
    {"Rockaways"=>["11691", "11692", "11693", "11694", "11695", "11697"]},
    {"Southeast Queens"=>["11004", "11005", "11411", "11413", "11422", "11426", "11427", "11428", "11429"]},
    {"Southwest Queens"=>["11414", "11415", "11416", "11417", "11418", "11419", "11420", "11421"]},
    {"West Queens"=>["11368", "11369", "11370", "11372", "11373", "11377", "11378"]}]},

  {"Staten Island"=> [
    {"Port Richmond"=>["10302", "10303", "10310"]},
    {"South Shore"=>["10306", "10307", "10308", "10309", "10312"]},
    {"Stapleton and St. George"=>["10301", "10304", "10305"]},
    {"Mid-Island"=>["10314"]}]}]


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
