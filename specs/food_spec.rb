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

class TestFood < MiniTest::Test
  def setup
    @food_1 = Food.new('Chips',6,13)
    @food_2 = Food.new('Crisps',7,6)
    @food_3 = Food.new('Kebab',8,25)
    @food_4 = Food.new('Burger',4,3)
    @food_5 = Food.new('Pizza',5,5)
  end

  def test_get_name
    assert_equal('Chips', @food_1.name)
  end

  def test_get_type
    assert_equal('food', @food_3.type)
  end

  def test_get_soberfy
    assert_equal(4, @food_4.soberfy)
  end

  def test_get_price
    assert_equal(6, @food_2.price)
  end
end
