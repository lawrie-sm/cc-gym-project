require_relative '../models/event'
require_relative '../models/member'

Event.delete_all

spin_class_time = Time.new(2019, 10, 1, 12, 30)
spin_class = Event.new(
  'name' => 'Spin Class',
  'description' => 'Cardio',
  'time' => spin_class_time
)
spin_class.save

lifting_class_time = Time.new(2019, 10, 2, 9, 0)
lifting_class = Event.new(
  'name' => 'Weightlifting Class',
  'description' => 'Strength',
  'time' => lifting_class_time
)
lifting_class.save

p Event.all
