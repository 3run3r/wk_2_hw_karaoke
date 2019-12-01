require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative('../guest')
require_relative('../room')
require_relative('../bartab')


class TestRoom < Minitest::Test

  def setup
    @guest1 = Guest.new('Matteo', 100, 'Wonderwall')
    @guest2 = Guest.new('John', 50, 'Come Together')
    @guest3 = Guest.new('Scott', 5, 'Creep')
    @song1 = Song.new('Wonderwall')
    @song2 = Song.new('Come Together')
    @bartab = BarTab.new(10, 1000)
    @room = Room.new('Red Room', 4)
  end

  def test_add_guest_to_space
    @room.add_guest(@guest1, @bartab)
    assert_equal(1, @room.number_of_guests)
    assert_equal(90, @guest1.wallet)
    assert_equal(1010, @bartab.till)
  end

# TO REVIEW:

  # def test_can_add_guest_to_space_capacity_not_reached
  #   @room.add_guest(@guest1, @bartab)
  #   @room.add_guest(@guest1, @bartab)
  #   assert_equal("We still have some space left!", @room.check_if_space_full)
  # end

  def test_cant_add_guests_anymore_reached_capacity
    @room.add_guest(@guest1, @bartab)
    @room.add_guest(@guest1, @bartab)
    @room.add_guest(@guest1, @bartab)
    @room.add_guest(@guest1, @bartab)
    assert_equal("Sorry, we're full", @room.add_guest(@guest1, @bartab))
  end

  def test_cant_add_guests_anymore_not_enough_money
    assert_equal("Sorry, you don't have enough money", @room.add_guest(@guest3, @bartab))
  end

  def test_can_remove_guest
    @room.add_guest(@guest1, @bartab)
    @room.add_guest(@guest2, @bartab)
    @room.remove_guest("Matteo")
    assert_equal(1, @room.number_of_guests)
  end

  def test_cant_find_guest_name
    @room.add_guest(@guest1, @bartab)
    @room.add_guest(@guest2, @bartab)
    assert_equal("Sorry, can't find this guest", @room.remove_guest("Ross"))
  end

  def test_get_list_of_guest_names
    @room.add_guest(@guest1, @bartab)
    @room.add_guest(@guest2, @bartab)
    assert_equal(["Matteo", "John"], @room.get_list_of_guest_names)
  end

  # def test_can_get_names_of_removed_guests
  #   @room.add_guest(@guest1)
  #   @room.add_guest(@guest2)
  #   removed_guest = @room.remove_guest(@guest1)
  #   assert_equal(["John"], removed_guest)
  # end

  def test_can_add_song_to_playlist
    @room.add_song_to_playlist(@song1)
    assert_equal(1, @room.number_of_songs)
  end

  def test_customer_finds_favorite_song
    @room.add_guest(@guest1, @bartab)
    @room.add_guest(@guest2, @bartab)
    @room.add_song_to_playlist(@song1)
    @room.add_song_to_playlist(@song2)
    assert_equal("Whooo", @room.found_favorite_song(@guest1))
  end



end
