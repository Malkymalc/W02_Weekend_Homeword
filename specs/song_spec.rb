require('minitest/autorun')
require('minitest/rg')
require_relative('../bar.rb')
require_relative('../food.rb')
require_relative('../transaction.rb')
require_relative('../drink.rb')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../till.rb')
require_relative('../venue.rb')

class TestSong < MiniTest::Test
  def setup
    @song_1 = Song.new('A Case of You','Joni Mitchel','Singer-Songwriter',4.23)
    @song_2 = Song.new('Beast of Burden','The Rolling Stones','Rock',5.15)
    @song_3 = Song.new('So What?','Miles Davis','Jazz',6.45)
    song_list = [@song_1,@song_2,@song_3]
  end

  def test_get_name
    assert_equal('A Case of You', @song_1.name)
  end

  def test_get_type
    assert_equal('Jazz', @song_3.type)
  end

  def test_get_artist
    assert_equal('Joni Mitchel', @song_1.artist)
  end

  def test_get_price
    assert_equal(5.15, @song_2.length)
  end





end
