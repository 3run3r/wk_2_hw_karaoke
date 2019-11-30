require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bartab')

class TestBarTab < Minitest::Test

  def setup
    @bartab = BarTab.new(10, 1000)
  end

  def test_can_add_to_till
    @bartab.add_to_till
    assert_equal(1010, @bartab.till)
  end

end
