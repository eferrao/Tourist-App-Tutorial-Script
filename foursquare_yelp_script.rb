require 'HTTParty'

puts "Welcome! Where are you?"
puts "Latitude:"
lat = gets.chomp
puts "Longitude:"
lon = gets.chomp

url =
"https://xap.ix-io.net/api/v1/foursquare/venues_by_lat_lons?filter%5Blatitude%5D=#{lat}&filter%5Blongitude%5D=#{lon}&fields%5Bvenues_by_lat_lons%5D=cross_street%2Clocation_latitude%2Clocation_longitude%2Cdistance%2Cpostal_code%2Ccountry_code%2Cneighborhood%2Ccity%2Cstate%2Ccountry%2Caddress%2Cformatted_address%2Cvenue_page_x_id%2Clongitude%2Clatitude%2Chas_perk%2Creferral_id%2Cstore_id%2Cvenue_rating_blacklisted%2Curl%2Cverified%2Cname%2Cx_id&sort=x_id&page%5Bnumber%5D=1&page%5Bsize%5D=100"

header = {"Accept" => "application/json", "Authorization" => "Foursquare_tester:wXIr37UhbHkZ5Ey2fc1z5dTunC6PxK3G"}
response = HTTParty.get(url, headers: header)
names = []
response["venues_by_lat_lons"].each do |loc|
  if names.length < 10
    names << loc["name"]
  end
end
puts "Here are the names of some places nearby:"
names.each_with_index do |name, index|
  puts "#{index + 1}. #{name}"
end

puts "Which place would you like to get reviews for? (enter number)"
location = gets.chomp
place = names[(location.to_i - 1)]

yelp_autocomplete_url = "https://xap.ix-io.net/api/v1/yelp/autocomplete_searches?filter%5Bquery%5D=#{place}&filter%5Blatitude%5D=#{lat}&filter%5Blongitude%5D=#{lon}&fields%5Bautocomplete_searches%5D=x_id%2Cname%2Cquery%2Clatitude%2Clongitude&sort=x_id&page%5Bnumber%5D=1&page%5Bsize%5D=100"

yelp_1_response = HTTParty.get(yelp_autocomplete_url, headers: header)
id = yelp_1_response["autocomplete_searches"][0]["x_id"]

yelp_reviews_url = "https://xap.ix-io.net/api/v1/yelp/reviews?filter%5Byelp_id%5D=#{id}&fields%5Breviews%5D=yelp_id%2Ctext%2Curl%2Cuser_name%2Cuser_image_url%2Ctime_created%2Crating&sort=time_created&page%5Bnumber%5D=1&page%5Bsize%5D=100"

yelp_2_response = HTTParty.get(yelp_reviews_url, headers: header)
yelp_2_response["reviews"].each do |rev|
  puts "Review snippet: " + rev["text"]
  puts "Rating: " + rev["rating"]
  puts "Review URL: " + rev["url"]
  puts ""
end
