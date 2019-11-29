require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative('../guest')
require_relative('../room')
require_relative('../bar')


class TestRoom < Minitest::Test

  def setup
    @guest1 = Guest.new('Matteo', 100, 'Wonderwall')
    @song1 = Song.new('Wonderwall')
    @song2 = Song.new('Come Together')
    @room = Room.new('Red Room', 1)
  end

  def test_can_add_guest_to_space
    @room.add_guest(@guest1)
    assert_equal(1, @room.number_of_songs)
  end

  def test_cant_add_guests_anymore_reached_capacity
    @room.add_guest(@guest1)
    @room.add_guest(@guest1)
    assert_equal(1, @room.number_of_songs)
  end



  # def test_can_add_song_to_playlist
  #   @room.add_song_to_playlist(@song1)
  #   @room.add_song_to_playlist(@song2)
  #   assert_equal(['Wonderwall', 'Come Together'], @room.playlist_result )
  # end



end
