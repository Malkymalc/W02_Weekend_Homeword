class Song
  attr_reader :name, :artist, :type, :length

  def initialize(name, artist, type, length)
    @name = name
    @artist = artist
    @type = type
    @length = length
  end

end
