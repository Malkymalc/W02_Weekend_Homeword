class Venue
  attr_reader :name, :song_list, :food_list, :drink_list

  def initialize(name,rooms_details)
    @name = name
    @rooms = []
    for room in rooms_details do
      new_room = Room.new(room[:name],room[:cap],self)
      @rooms.push(new_room)
    end
    @customers = []
    @drink_list = [{drink: @drink_1, count: 10},
                    {drink: @drink_2, count: 10},
                    {drink: @drink_3, count: 5},
                    {drink: @drink_4, count: 10},
                    {drink: @drink_5, count: 7}]
    @food_list = [{food: @food_1, count: 10},
                  {food: @food_2, count: 10},
                  {food: @food_3, count: 5},
                  {food: @food_4, count: 10},
                  {food: @food_5, count: 7}]
    @song_list = [@song_1,@song_2,@song_3]
    @staff = []
  end

#Get Methods
  def get_rooms_info
    puts "#{@name} has #{@rooms.length} rooms:"
    @rooms.each do |room|
      puts "#{room.name}, capacity: #{room.capacity}"
    end
  end

  def get_cellar_info
    @cellar.stock_check
  end

  def get_playlist_info
    @songlist.each { |song| puts "#{song.title}, #{song.artist}" }
  end

#Set Methods
  def set_drink_list
  end

  def set_food_list
  end

  def set_song_list
  end

#Other Actions
  def open_doors
    #way to autogenerate variable names, and/or object props?
    @guest_1 = Guest.new('Alan',1000,'A Case of You')
    @guest_2 = Guest.new('Bob',500,'Beast of Burden')
    @guest_3 = Guest.new('Chris',100,'Saturday Night')
    @guest_4 = Guest.new('Dave',75,'So What?')
    @guest_5 = Guest.new('Ellen',250,'In Bloom')
    @customers = [@guest_1,@guest_2,@guest_3,@guest_4,@guest_5]
  end

  def add_guest(name,cash,fav_song)
    @customers << Guest.new(name,cash,fav_song)
  end

  def bouncer(naughty_person)
    ejectee = @customers.find { |guest| guest.name = naughty_person }
    @customers.delete(ejectee)
  end
end
