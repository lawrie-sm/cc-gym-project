require_relative '../models/location'
require_relative '../models/event'
require_relative '../models/member'

Event.delete_all
Member.delete_all
Location.delete_all

#
# Seed locations
#

room_a = Location.new(
  'name' => 'room a',
  'capacity' => 5
)
room_a.save

room_b = Location.new(
  'name' => 'room b',
  'capacity' => 5
)
room_b.save

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
  'description' => 'Intense cardio.',
  'start_time' => Time.new(2019, 7, 30, 12, 30),
  'end_time' => Time.new(2019, 7, 30, 13, 30),
  'location_id' => spin_room.id
)
spin_class.save

yoga_class = Event.new(
  'name' => 'yoga class',
  'description' => 'Align your chakras.',
  'start_time' => Time.new(2019, 7, 30, 12, 45),
  'end_time' => Time.new(2019, 7, 30, 13, 45),
  'location_id' => room_a.id
)
yoga_class.save

lifting_class = Event.new(
  'name' => 'weightlifting class',
  'description' => 'Hefty strength workout.',
  'start_time' => Time.new(2019, 7, 31, 9, 0),
  'end_time' => Time.new(2019, 7, 31, 10, 0),
  'location_id' => weights_room.id
)
lifting_class.save

pilates_class = Event.new(
  'name' => 'pilates class',
  'description' => 'Something about core strength?',
  'start_time' => Time.new(2019, 8, 1, 15, 0),
  'end_time' => Time.new(2019, 8, 1, 16, 0),
  'location_id' => room_b.id
)
pilates_class.save

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
  'membership' => 'premium'
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
pilates_class.add_member(anne)
pilates_class.add_member(donald)
