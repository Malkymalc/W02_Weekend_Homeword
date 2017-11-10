require('minitest/autorun')
require('minitest/rg')
require_relative('../bar.rb')
require_relative('../cellar.rb')
require_relative('../drink.rb')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../sound_sys.rb')
require_relative('../till.rb')
require_relative('../venue.rb')

class TestBar < MiniTest::Test
  def setup
    @drink_1 = Drink.new('Red Wine',6,13)
    @drink_2 = Drink.new('Gin and Tonic',7,6)
    @drink_3 = Drink.new('Whiskey',8,25)
    @drink_4 = Drink.new('Lager',4,3)
    @drink_5 = Drink.new('Beer',5,5)
    drinks_list = [@drink_1,@drink_2,@drink_3,@drink_4,@drink_5]
    @cellar = Cellar.new(drinks_list) #how to add multiple drinks?

    @song_1 = Song.new('A Case of You','Joni Mitchel','Singer-Songwriter',4.23)
    @song_2 = Song.new('A Case of You','Joni Mitchel','Singer-Songwriter',4.23)
    @song_3 = Song.new('A Case of You','Joni Mitchel','Singer-Songwriter',4.23)
    song_list = [@song_1,@song_2,@song_3]
    @sound_sys = SoundSystem.new(song_list)

    @room_1 = Room.new('Main Room',35)
    @room_2 = Room.new('Djent Room', 13)
    @room_3 = Room.new('Side Room', 20)
    @room_4 = Room.new('Party Room', 25)
    @room_5 = Room.new('Small Room',7)
    #When Room is instantiated it will create a Bar.
    rooms = [@room_1,@room_2,@room_3,@room_4,@room_5]

    @venue = Venue.new('CodeClan Caraoke',sound_sys,cellar,rooms)
  end

  def test_

end
