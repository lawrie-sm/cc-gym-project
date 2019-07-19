require_relative '../models/event'
require_relative '../models/member'

spin_class_time = Time.new(2019, 10, 1, 12, 30)
spin_class = Event.new(
  'name' => 'Spin Class',
  'description' => 'Cardio',
  'time' => spin_class_time
)
spin_class.save
