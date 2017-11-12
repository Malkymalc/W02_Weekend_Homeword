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

class TestTransaction < MiniTest::Test
  def setup
    @ticket_1 = Ticket.new('Main Room',10)
    @drink_1 = Drink.new('Red Wine',6,13)
    @food_1 = Food.new('Chips',6,13)

    @transaction_1 = Transaction.new(@food_1,Time.now)
    @transaction_2 = Transaction.new(@drink_1,Time.now)
    @transaction_3 = Transaction.new(@ticket_1,Time.now)
  end

  def test_get_type
    assert_equal('food', @transaction_1.type)
  end

  def test_get_name
    assert_equal('Red Wine', @transaction_2.name)
  end

  def test_get_amount
    assert_equal(10, @transaction_3.amount)
  end

  def test_get_time
    assert_equal(Time.now, @transaction_3.time)
  end
end
