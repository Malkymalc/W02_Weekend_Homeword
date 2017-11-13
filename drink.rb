class Drink
  attr_reader :name, :strength, :price, :type

  def initialize(name,strength,price)
    @name = name
    @strength = strength
    @price = price
    @type = 'drink'
  end

end
