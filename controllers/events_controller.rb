require_relative '../models/event'
require_relative '../models/member'
require_relative '../models/location'
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

  # Build a list for the 'add member' dropdown
  @addable_members = Member.all.reject do |m|
    reject = false
    # Reject members who are already attending
    reject = true if @event.has_member?(m.id)
    # Reject basic members for peak events
    reject = true if m.membership == 'basic' && @event.peak?
    reject
  end

  erb(:'events/show')
end

# Post new event
post '/events' do
  start = Time.parse(params['start_time'])
  hours = params['hours'].to_i
  mins = params['mins'].to_i
  params['end_time'] = start + (mins * 60) + (hours * 60 * 60)
  event = Event.new(params)
  event.save
  redirect "/events/#{event.id}"
end

# Post updated event
post '/events/:id' do
  p "IVE GOT HERE"
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
