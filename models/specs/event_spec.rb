require 'minitest/autorun'
require_relative '../event'

class TestEvent < MiniTest::Test
  def setup
    @start_time = Time.new(1991, 1, 26, 13, 0)
    @end_time = Time.new(1991, 1, 26, 14, 15)
    @event = Event.new(
      'id' => 1,
      'name' => 'test event',
      'description' => 'A test event',
      'start_time' => @start_time,
      'end_time' => @end_time,
      'location_id' => 10
    )
  end

  def test_event_attrs
    assert_equal(@event.id, 1)
    assert_equal(@event.name, 'test event')
    assert_equal(@event.description, 'A test event')
    assert_equal(@event.start_time, @start_time)
    assert_equal(@event.end_time, @end_time)
    assert_equal(@event.location_id, 10)
  end

  def test_print_date
    assert_equal(@event.print_date, 'Jan 26')
  end

  def test_print_time
    assert_equal(@event.print_time, '13:00-14:15')
  end

  def test_duration
    assert_equal(@event.duration, hours: 1, mins: 15)
  end

  def test_peak__true
    assert(@event.peak?)
  end

  def test_peak__false
    @off_peak_start_time = Time.new(1991, 1, 26, 22, 0)
    @off_peak_end_time = Time.new(1991, 1, 26, 23, 0)
    @off_peak_event = Event.new(
      'id' => 2,
      'name' => 'test off peak event',
      'description' => 'off peak',
      'start_time' => @off_peak_start_time,
      'end_time' => @off_peak_end_time,
      'location_id' => 20
    )
    refute(@off_peak_event.peak?)
  end
end
