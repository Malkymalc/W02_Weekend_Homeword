class Guest
  attr_reader :name, :money, :drunkeness, :location

  def initialize(name, money, fav_song)
    @name = name
    @money = money
    @fav_song = fav_song
    @location = nil
    @drunkeness = 0
  end

# Consume
  def enough_cash?(order)
    @money >= order.price
  end

  def pay(order)
    @money -= order.price
  end

  def drink(drink)
    @drunkeness += drink.strength
  end

  def eat(food)
    @drunkeness -= food.soberfy
  end

  def enter_room(room)
    @location = room
  end

  def buy(order)
    return "Oh what, not enough cash!?" unless enough_cash?(order)
    order.sale(self,order) if @location == nil
    @location.sale(self,order) if @location != nil
    drink(order) if order.type == 'drink'
    eat(order) if order.type == 'food'
    enter_room(order) if order.type == 'entry'
  end

# Party
  def fav_song_on_list?
    @location.song_list.include?(@my_fav_song)
  end

  def celebrate
    return unless fav_song_on_list?
    return "Oh you beauty" if @drunkeness < 10
    return "Oh you beauty!" if @drunkeness < 20
    return "OH YOU BEAUTY!!!"
  end

end
