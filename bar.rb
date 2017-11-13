class Bar
  attr_reader :drink_list, :food_list, :room 

  def initialize(venue,room)
    @till = Till.new(room,venue)
    @drink_list = venue.drink_list
    @food_list = venue.food_list
    @room = room
  end

  def have_drink?(order)
    drink_wanted = @drink_list.find { |drink| drink[:drink].name == order.name }
    return drink_wanted[:count] > 0
  end

  def have_food?(order)
    food_wanted = @food_list.find { |food| food[:food].name == order.name }
    return food_wanted[:count] > 0
  end

  def in_stock?(order)
    return true if order.type == 'entry' && @room.spaces?
    return true if order.type == 'drink' && have_drink?
    return true if order.type == 'food' && have_food?
    return false
  end

  def serve_drink(guest,order)
    drink_wanted = @drink_list.find { |drink| drink[:name].name == order.name }
    drink_wanted[:count] -= 1
    guest.drink(drink_wanted)
  end

  def serve_food(guest,order)
    food_wanted = @food_list.find { |food| food[:name].name == order.name }
    food_wanted[:count] -= 1
    guest.eat(food_wanted)
  end

  def admit(guest)
    @room.add_guest(guest)
  end

  def sale(guest,order)
    return "No room at the inn" if order[:type] == 'entry' && !@room.spaces?
    return "Sorry we're out of #{order[:name]}" unless in_stock?(order)
    serve_drink(order) if order.type == 'drink'
    serve_food(order) if order.type == 'food'
    admit(guest) if order.type == 'entry'
    guest.pay(order)
    till.take_payment(order)
    till.add_transaction(order)
  end

end
