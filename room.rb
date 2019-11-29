class Room
  attr_reader :name

  def initialize(name, capacity)
    @name = name
    @space = []
    @playlist = []
    @capacity = capacity
  end

  def add_guest(guest)
    if @space.length < @capacity
      @space.push(guest)
    else
      return "We're full sorry"
    end
  end

  def number_of_songs
    return @space.length
  end

  def add_song_to_playlist(song)
    @playlist.push(song)
  end

  # def playlist_result
  #   @playlist.each {|song| name}
  # end

end
