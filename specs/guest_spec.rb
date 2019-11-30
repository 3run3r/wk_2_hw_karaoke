require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative('../guest')
require_relative('../bartab')

class TestGuest < Minitest::Test

  def setup
    @guest1 = Guest.new('Matteo', 100, 'Wonderwall')
    @bartab = BarTab.new(10, 1000)
    @song1 = Song.new('Wonderwall')
    @song2 = Song.new('Come Together')
  end

  def test_can_get_guest_name
    assert_equal('Matteo', @guest1.name)
  end

  def test_customer_is_charged_upon_entry
    @guest1.pays_fee(@bartab)
    assert_equal(90, @guest1.wallet)
  end

end
