require_relative '../models/event'
require_relative '../models/member'

spin_class = Event.new(
  'name' => 'Spin Class',
  'description' => 'Cardio',
  'time' => Time.now
)
spin_class.save
