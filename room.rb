class Room
  attr_reader :name, :capacity, :venue, :song_list, :bar, :price

  def initialize(name, capacity, venue)
    @name = name
    @capacity = capacity
    @venue = venue
    @bar = Bar.new(venue, self)
    @song_list = venue.song_list
    #@drink_list = venue.drink_list
    #@food_list = venue.food_list
    @occupants = []
    @price = 8
  end

  def spaces?
    return @capacity > @occupants.count
  end

  def add_guest(guest)
    @occupants << guest
    guest.enter_room(self)
    guest.celebrate
  end

end
