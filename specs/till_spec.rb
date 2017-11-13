require('minitest/autorun')
require('minitest/rg')
require_relative('../bar.rb')
require_relative('../ticket.rb')
require_relative('../drink.rb')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../transaction.rb')
require_relative('../till.rb')
require_relative('../venue.rb')
require_relative('../food.rb')

class TestTill < MiniTest::Test
  def setup
    @drink_1 = Drink.new('Red Wine',6,10)
    @food_1 = Food.new('Chips',6,5)

    @till_1 = Till.new()
  end

  def test_add_transaction
    @till_1.add_transaction(@food_1)
    @till_1.add_transaction(@drink_1)
    assert_equal('Red Wine',@till_1.transactions.last.name)
  end

  def test_take_payment
    @till_1.take_payment(@food_1)
    @till_1.take_payment(@drink_1)
    assert_equal(65,@till_1.float)
  end

end
