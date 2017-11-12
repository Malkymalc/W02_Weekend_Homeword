require('minitest/autorun')
require('minitest/rg')
require_relative('../bar.rb')
require_relative('../transaction.rb')
require_relative('../drink.rb')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../till.rb')
require_relative('../venue.rb')

class TestDrink < MiniTest::Test
  def setup
    @drink_1 = Drink.new('Red Wine',13,6)
    @drink_2 = Drink.new('Gin and Tonic',7,6)
    @drink_3 = Drink.new('Whiskey',25,8)
    @drink_4 = Drink.new('Lager',3,4)
    @drink_5 = Drink.new('Beer',5,5)
    # drinks_list = [@drink_1,@drink_2,@drink_3,@drink_4,@drink_5]
    # @cellar = Cellar.new(drinks_list) #add multiples of drinks at instantiation?
    #
    # @song_1 = Song.new('A Case of You','Joni Mitchel','Singer-Songwriter',4.23)
    # @song_2 = Song.new('Beast of Burden','The Rolling Stones','Rock',5.15)
    # @song_3 = Song.new('So What?','Miles Davis','Jazz',6.45)
    # song_list = [@song_1,@song_2,@song_3]
    # @sound_sys = SoundSystem.new(song_list)
    #
    # @room_1 = Room.new('Main Room',35)
    # @room_2 = Room.new('Djent Room', 13)
    # @room_3 = Room.new('Side Room', 20)
    # @room_4 = Room.new('Party Room', 25)
    # @room_5 = Room.new('Small Room',7)
    # #When Room is instantiated it will instatiate a Bar,
    # #which in turn will instantiate a Till with a £50 float, and have a default stock of drinks
    # rooms = [@room_1,@room_2,@room_3,@room_4,@room_5]
    #
    # @guest_1 = Guest.new('Alan',1000,'A Case of You')
    # @guest_2 = Guest.new('Bob',500,'Beast of Burden')
    # @guest_3 = Guest.new('Chris',100,'Saturday Night')
    # @guest_4 = Guest.new('Dave',75,'So What?')
    # @guest_5 = Guest.new('Ellen',250,'In Bloom')
    #
    # @venue = Venue.new('CodeClan Caraoke',@sound_sys,@cellar,rooms)
  end

  def test_get_name
    assert_equal('Red Wine', @drink_1.name)
  end

  def test_get_type
    assert_equal('drink', @drink_3.type)
  end

  def test_get_strength
    assert_equal(3, @drink_4.strength)
  end

  def test_get_price
    assert_equal(6, @drink_2.price)
  end
end
