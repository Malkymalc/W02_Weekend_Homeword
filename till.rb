require_relative('transaction.rb')

class Till
  attr_reader :float, :transactions, :room, :venue

  def initialize(venue,room)
    @float = 50
    @transactions = []
    @room = room
    @venue = venue
  end

  def add_transaction(order)
    time = Time.now
    transaction = Transaction.new(order,time)
    @transactions << transaction
  end

  def take_payment(order)
    @float += order.price
  end

end
