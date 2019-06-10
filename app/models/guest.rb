class Guest

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def listings
    new_array = []
    Trip.all.each do |trip|
      if trip.guest == self
        new_array << trip.listing
      end
    end
    new_array
  end

  def trips
    Trip.all.select do |trip|
      trip.guest == self
    end
  end

  def trip_count
    # binding.pry
    trips.count
  end

  def self.pro_traveller
      self.all.select do |guest|
        if guest.trip_count > 1
            guest
        end
      end
  end

  def self.find_all_by_name(name)
    self.all.select do |guest|
      name == guest.name
    end
  end

  def self.all
    @@all
  end

end
