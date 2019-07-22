require_relative '../models/location'

get '/locations' do
  @locations = Location.all
  erb(:'locations/index')
end
