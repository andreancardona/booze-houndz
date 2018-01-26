class Neighborhood < ApplicationRecord
  has_many :liquor_stores

  def zip_array
    {"Manhattan"=> [
      ,

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
  end

  def hood_finder
    {"10453"=>["Central Bronx", "Bronx"],
    "10457"=>["Central Bronx", "Bronx"],
    "10460"=>["Central Bronx", "Bronx"],
    "10458"=>["Bronx Park and Fordham", "Bronx"],
    "10467"=>["Bronx Park and Fordham", "Bronx"],
    "10468"=>["Bronx Park and Fordham", "Bronx"],
    "10451"=>["High Bridge and Morrisania", "Bronx"],
    "10452"=>["High Bridge and Morrisania", "Bronx"],
    "10456"=>["High Bridge and Morrisania", "Bronx"],
    "10454"=>["Hunts Point and Mott Haven", "Bronx"],
    "10455"=>["Hunts Point and Mott Haven", "Bronx"],
    "10459"=>["Hunts Point and Mott Haven", "Bronx"],
    "10474"=>["Hunts Point and Mott Haven", "Bronx"],
    "10463"=>["Kingsbridge and Riverdale", "Bronx"],
    "10471"=>["Kingsbridge and Riverdale", "Bronx"],
    "10466"=>["Northeast Bronx", "Bronx"],
    "10469"=>["Northeast Bronx", "Bronx"],
    "10470"=>["Northeast Bronx", "Bronx"],
    "10475"=>["Northeast Bronx", "Bronx"],
    "10461"=>["Southeast Bronx", "Bronx"],
    "10462"=>["Southeast Bronx", "Bronx"],
    "10464"=>["Southeast Bronx", "Bronx"],
    "10465"=>["Southeast Bronx", "Bronx"],
    "10472"=>["Southeast Bronx", "Bronx"],
    "10473"=>["Southeast Bronx", "Bronx"],
    "11212"=>["Central Brooklyn", "Brooklyn"],
    "11213"=>["Central Brooklyn", "Brooklyn"],
    "11216"=>["Central Brooklyn", "Brooklyn"],
    "11233"=>["Central Brooklyn", "Brooklyn"],
    "11238"=>["Central Brooklyn", "Brooklyn"],
    "11209"=>["Southwest Brooklyn", "Brooklyn"],
    "11214"=>["Southwest Brooklyn", "Brooklyn"],
    "11228"=>["Southwest Brooklyn", "Brooklyn"],
    "11204"=>["Borough Park", "Brooklyn"],
    "11218"=>["Borough Park", "Brooklyn"],
    "11219"=>["Borough Park", "Brooklyn"],
    "11230"=>["Borough Park", "Brooklyn"],
    "11234"=>["Canarsie and Flatlands", "Brooklyn"],
    "11236"=>["Canarsie and Flatlands", "Brooklyn"],
    "11239"=>["Canarsie and Flatlands", "Brooklyn"],
    "11223"=>["Southern Brooklyn", "Brooklyn"],
    "11224"=>["Southern Brooklyn", "Brooklyn"],
    "11229"=>["Southern Brooklyn", "Brooklyn"],
    "11235"=>["Southern Brooklyn", "Brooklyn"],
    "11201"=>["Northwest Brooklyn", "Brooklyn"],
    "11205"=>["Northwest Brooklyn", "Brooklyn"],
    "11215"=>["Northwest Brooklyn", "Brooklyn"],
    "11217"=>["Northwest Brooklyn", "Brooklyn"],
    "11231"=>["Northwest Brooklyn", "Brooklyn"],
    "11203"=>["Flatbush", "Brooklyn"],
    "11210"=>["Flatbush", "Brooklyn"],
    "11225"=>["Flatbush", "Brooklyn"],
    "11226"=>["Flatbush", "Brooklyn"],
    "11207"=>["East New York and New Lots", "Brooklyn"],
    "11208"=>["East New York and New Lots", "Brooklyn"],
    "11211"=>["Greenpoint", "Brooklyn"],
    "11222"=>["Greenpoint", "Brooklyn"],
    "11220"=>["Sunset Park", "Brooklyn"],
    "11232"=>["Sunset Park", "Brooklyn"],
    "11206"=>["Bushwick and Williamsburg", "Brooklyn"],
    "11221"=>["Bushwick and Williamsburg", "Brooklyn"],
    "11237"=>["Bushwick and Williamsburg", "Brooklyn"],
    "10026"=>["Central Harlem", "Manhattan"],
    "10027"=>["Central Harlem", "Manhattan"],
    "10030"=>["Central Harlem", "Manhattan"],
    "10037"=>["Central Harlem", "Manhattan"],
    "10039"=>["Central Harlem", "Manhattan"],
    "10001"=>["Chelsea and Clinton", "Manhattan"],
    "10011"=>["Chelsea and Clinton", "Manhattan"],
    "10018"=>["Chelsea and Clinton", "Manhattan"],
    "10019"=>["Chelsea and Clinton", "Manhattan"],
    "10020"=>["Chelsea and Clinton", "Manhattan"],
    "10036"=>["Chelsea and Clinton", "Manhattan"],
    "10029"=>["East Harlem", "Manhattan"],
    "10035"=>["East Harlem", "Manhattan"],
    "10010"=>["Gramercy Park and Murray Hill", "Manhattan"],
    "10016"=>["Gramercy Park and Murray Hill", "Manhattan"],
    "10017"=>["Gramercy Park and Murray Hill", "Manhattan"],
    "10022"=>["Gramercy Park and Murray Hill", "Manhattan"],
    "10012"=>["Greenwich Village and Soho", "Manhattan"],
    "10013"=>["Greenwich Village and Soho", "Manhattan"],
    "10014"=>["Greenwich Village and Soho", "Manhattan"],
    "10004"=>["Lower Manhattan", "Manhattan"],
    "10005"=>["Lower Manhattan", "Manhattan"],
    "10006"=>["Lower Manhattan", "Manhattan"],
    "10007"=>["Lower Manhattan", "Manhattan"],
    "10008"=>["Lower Manhattan", "Manhattan"],
    "10280"=>["Lower Manhattan", "Manhattan"],
    "10002"=>["Lower East Side", "Manhattan"],
    "10003"=>["Lower East Side", "Manhattan"],
    "10009"=>["Lower East Side", "Manhattan"],
    "10021"=>["Upper East Side", "Manhattan"],
    "10028"=>["Upper East Side", "Manhattan"],
    "10044"=>["Upper East Side", "Manhattan"],
    "10065"=>["Upper East Side", "Manhattan"],
    "10074"=>["Upper East Side", "Manhattan"],
    "10128"=>["Upper East Side", "Manhattan"],
    "10031"=>["Inwood and Washington Heights", "Manhattan"],
    "10032"=>["Inwood and Washington Heights", "Manhattan"],
    "10033"=>["Inwood and Washington Heights", "Manhattan"],
    "10034"=>["Inwood and Washington Heights", "Manhattan"],
    "10040"=>["Inwood and Washington Heights", "Manhattan"],

  end

  def hood
    zip = self.name
    if hood_finder[zip]
      hood_finder[zip][0]
    else
      "New Jersey"
    end
  end

  def borough
    zip = self.name
    if hood_finder[zip]
      hood_finder[zip][1]
    else
      "New Jersey"
    end
  end
end
