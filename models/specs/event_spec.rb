require 'minitest/autorun'
require_relative '../event'

class TestEvent < MiniTest::Test
  def setup
    @time = Time.now
    @event = Event.new(
      'id' => 1,
      'name' => 'Test Event',
      'description' => 'A test event',
      'time' => @time
    )
  end

  def test_event_attrs
    assert_equal(@event.id, 1)
    assert_equal(@event.name, 'Test Event')
    assert_equal(@event.description, 'A test event')
    assert_equal(@event.time, @time)
  end
end
