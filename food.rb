class Food
  attr_reader :name, :soberfy, :price, :type

  def initialize(name,soberfy,price)
    @name = name
    @soberfy = soberfy
    @price = price
    @type = 'food'
  end

end
