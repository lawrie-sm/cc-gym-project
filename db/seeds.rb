require_relative '../models/location'
require_relative '../models/event'
require_relative '../models/member'

Event.delete_all
Member.delete_all
Location.delete_all

#
# Seed locations
#

weights_room = Location.new(
  'name' => 'weights room',
  'capacity' => 3
)
weights_room.save

spin_room = Location.new(
  'name' => 'spin room',
  'capacity' => 5
)
spin_room.save

#
# Seed events
#

spin_class = Event.new(
  'name' => 'spin class',
  'description' => 'cardio',
  'time' => Time.new(2020, 10, 1, 12, 30),
  'location_id' => spin_room.id
)
spin_class.save

lifting_class = Event.new(
  'name' => 'weightlifting class',
  'description' => 'strength',
  'time' => Time.new(2020, 10, 2, 9, 0),
  'location_id' => weights_room.id
)
lifting_class.save

#
# Seed members
#

arnold = Member.new(
  'first_name' => 'arnold',
  'last_name' => 'schwarzenegger',
  'membership' => 'premium'
)
arnold.save
conor = Member.new(
  'first_name' => 'conor',
  'last_name' => 'mcgregor',
  'membership' => 'basic'
)
conor.save
silvio = Member.new(
  'first_name' => 'silvio',
  'last_name' => 'berlusconi',
  'membership' => 'basic'
)
silvio.save
donald = Member.new(
  'first_name' => 'donald',
  'last_name' => 'trump',
  'membership' => 'basic'
)
donald.save
anne = Member.new(
  'first_name' => 'anne',
  'last_name' => 'stuart',
  'membership' => 'premium'
)
anne.save
#
# Associate members with events
#

spin_class.add_member(arnold)
spin_class.add_member(anne)
spin_class.add_member(silvio)
lifting_class.add_member(arnold)
lifting_class.add_member(conor)
