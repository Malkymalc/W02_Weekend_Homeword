class Transaction
  attr_reader :type, :name, :amount, :time

  def initialize(order,time)
    @type = order.type
    @name = order.name
    @amount = order.price
    @time = time
  end

end
