class Listing

  attr_accessor :city, :name

  @@all = []

  def initialize(name, city)
    @name = name
    @city = city
    @@all << self
  end

  def trips
    Trip.all.select do |trip|
      trip.listing == self
    end
  end

  def trip_count
    # binding.pry
    trips.count
  end

  def guests
    new_array = []
    Trip.all.each do |trip|
      if trip.listing == self
        new_array << trip.guest
      end
    end
    new_array
  end

  def self.find_all_by_city(city)
    self.all.select do |listing|
      city == listing.city
    end
  end

  def self.most_popular
    trips_taken = 0
    popular_listing = nil
    self.all.each do |listing|
      listing.trip_count
        if listing.trip_count > trips_taken
          trips_taken = listing.trip_count
          popular_listing = listing
        end
    end
    return popular_listing
  end


  def self.all
    @@all
  end


end
