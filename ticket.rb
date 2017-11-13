class Ticket
  attr_reader :name, :price, :type

  def initialize(location)
    @name = location
    @price = price
    @type = 'entry'
  end

end
