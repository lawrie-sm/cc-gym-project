require_relative '../models/location'

# Index
get '/locations' do
  @locations = Location.all
  erb(:'locations/index')
end

# Create new location form
# get '/locations/new' do
#   @l = Event.all
#   erb(:'events/new')
# end
