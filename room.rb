class Room
  attr_reader :name

  def initialize(name, capacity)
    @name = name
    @space = []
    @playlist = []
    @capacity = capacity
  end

  def add_guest(guest, bartab)
    if @space.length >= @capacity
      return "Sorry, we're full"
    elsif guest.wallet < bartab.entry_fee
      return "Sorry, you don't have enough money"
    else
      @space.push(guest)
      bartab.add_to_till
      guest.pays_fee(bartab)
    end
  end

  def remove_guest(guest_to_find)
    @space.find {|guest|
      @space.delete(guest) if guest.name == guest_to_find}
  end

  # def return_removed_guests(guest_to_find)
  #   removed_guests = remove_guest(guest_to_find)
  #   removed_guests_names = removed_guests.map {|guest| guest.name}
  # end

  def get_list_of_guest_names
    guest_names = @space.map {|guest| guest.name}
  end

# TO REVIEW:

  # def space_left
  #     return "We still have some space left!"
  # end

  def number_of_guests
    return @space.length
  end

  def add_song_to_playlist(song)
    @playlist.push(song)
  end

  def number_of_songs
    return @playlist.length
  end

  def found_favorite_song(guest)
    song_names = @playlist.map {|song| song.name}
    song_names.find {|song| return "Whooo" if song == guest.favorite_song}
  end

end
