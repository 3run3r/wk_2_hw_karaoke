class Guest

  attr_reader :name, :wallet, :favorite_song

  def initialize(name, wallet, favorite_song)
    @name = name
    @wallet = wallet
    @favorite_song = favorite_song
  end

  # def found_favorite_song(song)
  #   return 'Whooo!' if song.name == @favorite_song
  # end

end
