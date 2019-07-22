require_relative '../models/location'

# Index
get '/locations' do
  @locations = Location.all
  erb(:'locations/index')
end

# Create new location form
get '/locations/new' do
  erb(:'locations/new')
end

# Edit locations form
get '/locations/:id/edit' do
  @location = Location.find(params['id'])
  erb(:'/locations/edit')
end

# Post to create new location
post '/locations' do
  location = Location.new(params)
  location.save
  redirect '/locations'
end

# Post to edit location
post '/locations/:id' do
  location = Location.new(params)
  location.update
  redirect '/locations'
end

# Post to delete location
post '/locations/:id/delete' do
  Location.delete(params['id'])
  redirect '/locations'
end
