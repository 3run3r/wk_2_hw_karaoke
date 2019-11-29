require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')

class TestSong < Minitest::Test

  def setup
    @song1 = Song.new('Wonderwall')
  end

  def test_can_get_song_name
    assert_equal('Wonderwall', @song1.name)
  end

end
