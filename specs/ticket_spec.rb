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
require_relative('../food.rb')
require_relative('../ticket.rb')

class TestTicket < MiniTest::Test
  def setup
    @ticket_1 = Ticket.new('Main Room',8)
    @ticket_2 = Ticket.new('Jazz Room',8)
    @ticket_3 = Ticket.new('Rock',8)

  end

  def test_get_location
    assert_equal('Main Room', @ticket_1.location)
  end

  def test_get_price
    assert_equal(8, @ticket_3.price)
  end

  def test_get_type
    assert_equal('entry', @ticket_3.type)
  end
end
