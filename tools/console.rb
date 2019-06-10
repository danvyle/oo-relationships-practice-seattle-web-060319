require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

condo = Listing.new("condo", "seattle")
home = Listing.new("home", "california")
vacay = Listing.new("vacay", "california")

claire = Guest.new("claire")
guest1 = Guest.new("claire")

Trip.new(condo, claire)
Trip.new(home, claire)
Trip.new(condo, guest1)
condo.trips

Pry.start
