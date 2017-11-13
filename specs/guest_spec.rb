require('minitest/autorun')
require('minitest/rg')
require_relative('../bar.rb')
require_relative('../ticket.rb')
require_relative('../drink.rb')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../food.rb')
require_relative('../till.rb')
require_relative('../venue.rb')

class TestGuest < MiniTest::Test
  def setup
    @drink_1 = Drink.new('Red Wine',6,13)
    @drink_2 = Drink.new('Gin and Tonic',7,6)
    @drink_3 = Drink.new('Whiskey',8,25)
    @drink_4 = Drink.new('Lager',4,3)
    @drink_5 = Drink.new('Beer',5,5)

    @food_1 = Food.new('Chips',6,5)
    @ticket_1 = Ticket.new(@room_1)

    @song_1 = Song.new('A Case of You','Joni Mitchel','Singer-Songwriter',4.23)
    @song_2 = Song.new('Beast of Burden','The Rolling Stones','Rock',5.15)
    @song_3 = Song.new('So What?','Miles Davis','Jazz',6.45)
    song_list = [@song_1,@song_2,@song_3]

    room_details = [{name:'Main Room', cap: 35},
                    {name:'Djent Room', cap: 13},
                    {name:'Side Room', cap: 20},
                    {name:'Party Room', cap: 25},
                    {name: 'Small Room', cap: 7}]
    @venue_1 = Venue.new('CodeClan Caraoke',room_details)

    @guest_1 = Guest.new('Alan',1000,'A Case of You')
    @guest_2 = Guest.new('Bob',500,'Beast of Burden')
    @guest_3 = Guest.new('Chris',100,'Saturday Night')
    @guest_4 = Guest.new('Dave',10,'So What?')
    @guest_5 = Guest.new('Ellen',250,'In Bloom')
  end

  def test_enough_cash?__true
    assert_equal(true, @guest_1.enough_cash?(@drink_1))
  end

  def test_enough_cash?
    assert_equal(false, @guest_4.enough_cash?(@drink_1))
  end

  def test_pay
    @guest_2.pay(@food_1)
    assert_equal(495,@guest_2.money)
  end

  def test_drink
    @guest_3.drink(@drink_1)
    assert_equal(6,@guest_3.drunkeness)
  end

  def test_food
    @guest_2.drink(@drink_3)
    @guest_2.eat(@food_1)
    assert_equal(2,@guest_2.drunkeness)
  end

  def enter_room
    @guest_5.enter_room(@room_3)
    assert_equal('Side Room',@guest_5.location.name)
  end

  # def test_buy__ticket
  #   @guest_1.buy(@ticket_1)
  #   assert_equal('Main Room',@guest_1.location.name)
  #   assert_equal(992, @guest_1.money)
  # end

  def test_fav_song_on_list?
    @guest_1.enter_room(@room_1)
    assert_equal(true, @guest_1.fav_song_on_list?)
  end

  def test_fav_song_on_list?
    @guest_3.enter_room(@room_1)
    assert_equal(false,@guest_3.fav_song_on_list?)
  end

  def test_venue_check
    @guest_5.enter_room(@room_3)
    assert_equal([@song_1,@song_2,@song_3],@guest_5.location.song_list)
  end

end
