require 'minitest/autorun'
require_relative '../event'

class TestEvent < MiniTest::Test
  def setup
    @time = Time.new(1991, 1, 26, 13, 0)
    @event = Event.new(
      'id' => 1,
      'name' => 'test event',
      'description' => 'A test event',
      'time' => @time,
      'location_id' => 10
    )
  end

  def test_event_attrs
    assert_equal(@event.id, 1)
    assert_equal(@event.name, 'test event')
    assert_equal(@event.description, 'A test event')
    assert_equal(@event.time, @time)
    assert_equal(@event.location_id, 10)
  end

  def test_html_time_string
    assert_equal(@event.html_time_string, '1991-01-26T13:00')
  end

  def test_peak__true
    assert(@event.peak?)
  end

  def test_peak__false
    @off_peak_time = Time.new(1991, 1, 26, 22, 0)
    @off_peak_event = Event.new(
      'id' => 2,
      'name' => 'test off peak event',
      'description' => 'off peak',
      'time' => @off_peak_time,
      'location_id' => 20
    )
    refute(@off_peak_event.peak?)
  end
end
