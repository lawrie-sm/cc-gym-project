require 'minitest/autorun'
require_relative '../location'

class TestLocation < MiniTest::Test
  def setup
    @location = Location.new(
      'id' => 1,
      'name' => 'test room',
      'capacity' => 10
    )
  end

  def test_location_attr
    assert_equal(@location.id, 1)
    assert_equal(@location.name, 'test room')
    assert_equal(@location.capacity, 10)
  end
end
