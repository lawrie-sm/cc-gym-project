require_relative '../models/event'
require_relative '../models/member'

Event.delete_all
Member.delete_all

spin_class_time = Time.new(2019, 10, 1, 12, 30)
spin_class = Event.new(
  'name' => 'spin class',
  'description' => 'cardio',
  'time' => spin_class_time
)
spin_class.save

lifting_class_time = Time.new(2019, 10, 2, 9, 0)
lifting_class = Event.new(
  'name' => 'weightlifting class',
  'description' => 'strength',
  'time' => lifting_class_time
)
lifting_class.save

arnold = Member.new(
  'name' => 'arnold schwarzenegger',
  'membership' => 'premium'
)
arnold.save

conor = Member.new(
  'name' => 'conor mcgregor',
  'membership' => 'basic'
)
conor.save
