require_relative '../models/event'
require_relative '../models/member'

Event.delete_all
Member.delete_all

#
# Seed events
#

spin_class = Event.new(
  'name' => 'spin class',
  'description' => 'cardio',
  'time' => Time.new(2019, 10, 1, 12, 30)
)
spin_class.save
lifting_class = Event.new(
  'name' => 'weightlifting class',
  'description' => 'strength',
  'time' => Time.new(2019, 10, 2, 9, 0)
)
lifting_class.save

#
# Seed members
#

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

#
# Associate members with events
#

spin_class.add_member(arnold)
lifting_class.add_member(arnold)
lifting_class.add_member(conor)
