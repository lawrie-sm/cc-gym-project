require_relative '../models/event'
require_relative '../models/member'
require_relative '../models/location'
require_relative '../models/time_utils'
require 'pry-byebug'

# Index
get '/events' do
  @events = Event.all
  erb(:'events/index')
end

# Create event form
get '/events/new' do
  @locations = Location.all
  erb(:'events/new')
end

# Edit event form
get '/events/:id/edit' do
  @event = Event.find(params['id'])
  @locations = Location.all
  erb(:'events/edit')
end

# Show individual event
get '/events/:id' do
  @event = Event.find(params['id'])
  erb(:'events/show')
end

# Post new event
post '/events' do
  Event.create_recurring_events(params)
  redirect "/events"
end

# Post updated event
post '/events/:id' do
  event = Event.new(params)
  event.update
  redirect "/events/#{event.id}"
end

# Post new member to event
post '/events/:id/add-member' do
  @event = Event.find(params['id'])
  @member = Member.find(params['member_id'])
  @event.add_member(@member)
  redirect "/events/#{@event.id}"
end

# Post to remove member from event
post '/events/:id/remove-member' do
  @event = Event.find(params['id'])
  @event.remove_member(params['member_id'])
  redirect "/events/#{@event.id}"
end

# Post to delete event
post '/events/:id/delete' do
  Event.delete(params['id'])
  redirect '/events'
end

# Post to delete all events with name
post '/events/:name/delete-all' do
  Event.delete_all_in_series(params['name'])
  redirect '/events'
end
