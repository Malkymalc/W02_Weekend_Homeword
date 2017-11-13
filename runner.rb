require_relative('../bar.rb')
require_relative('../cellar.rb')
require_relative('../drink.rb')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../sound_sys.rb')
require_relative('../till.rb')
require_relative('../venue.rb')

class Runner

  def initialize
    @action_hash = {
      quit: quit,
      print_options: print_options,
      add_user: add_delete_staff
      add_customer: add_guest
    }
    welcome_set_up
  end

# ********** VALIDATION/AUTH METHODS ***************
  def validate_input (type, input_var_name)
    return "Please enter a #{type}" unless type == input_var_name.class
  end

  def user_auth? (user,action)

  end
# ********** INITIALISATION ***************

  def welcome_set_up
    puts "***** Welcome to Kara-OKAY, the Karaoke app *****"
    puts "What is your karaoke venue called?"
    venue_name = gets.chomp
    validate_input(string,venue_name)
    "How many rooms does your venue have?"
    room_count = gets.chomp
    validate_input(integer,room_count)
    count = 1
    while count <= room_count
      "What is room number #{count} called?"
      room_name = gets.chomp
      validate_input(integer,room_name)
      rooms_pairs_arr[count-1] << room_name
      "What is room number #{count}'s capacity?"
      room_cap = gets.chomp
      validate_input(integer,room_cap)
    end
    rooms = []
    room_name_arr.e do |name,capacity|
      rooms << Room.new(name,capacity)
    end
    Venue.new(name,rooms)
    p "Your venue is all set up"
    # print summary of venue?
    p "Here are your options:"
    print_options
    next_action_prompt
  end

# ********* CONTROL **********
  def print_options
    puts ""
    puts ""
    puts ""
  end

  def next_action_prompt
    p "What would you like to do next?"
    user_action = gets.chomp
    validate_input(str, user_action)
    user_action = user_action.to_sym
    @action_hash[user_action][method]
    next_action_prompt
  end

  def quit
    p "Are you sure you want to quit?"
    confirm = gets.chomp.downcase!
    next_action_prompt if confirm !== "y"
    return "Thank you and good night"
  end

# *********USER SET-UP*********
  def add_delete_staff(action)
    p "Please enter member's name"
    user_name = gets.chomp
    validate_input(str,user_name)
    p "Please enter staff password"
    user_password = gets.chomp.downcase!
    validate_input
    @staff.delete() if action == 'delete'
    @staff << [user_name,user_password] if action == 'add'
  end

# *********CUSTOMER SET-UP*********
  def add_guest

  end

# *********ROOM GET METHODS*********


# *********ROOM SET METHODS*********
  def

# *********VENUE GET METHODS*********
  def get_till_receipts

  end

# *********VENUE SET METHODS*********
  def set_drink_list
    venue.set_drink_list
  end

  def set_food_list
    venue.set_food_list
  end

  def set_song_list
    venue.set_song_list
  end
end


Runner.new()
