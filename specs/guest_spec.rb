require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative('../guest')

class TestGuest < Minitest::Test

  def setup
    @guest1 = Guest.new('Matteo', 100, 'Wonderwall')
    @song1 = Song.new('Wonderwall')
    @song2 = Song.new('Come Together')
  end

  def test_can_get_guest_name
    assert_equal('Matteo', @guest1.name)
  end

  def test_customer_gets_favorite_song
    assert_equal('Whooo!', @guest1.found_favorite_song(@song1))
  end

end
