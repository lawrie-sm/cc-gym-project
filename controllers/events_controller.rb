require_relative '../models/event'
require 'pry-byebug'

# Index
get '/events' do
  @events = Event.all
  erb(:'events/index')
end

# Create form
get '/events/new' do
  @events = Event.all
  erb(:'events/new')
end

# Update form
get '/events/:id/edit' do
  @event = Event.find(params['id'])
  erb(:'events/edit')
end

# New
post '/events' do
  event = Event.new(params)
  event.save
  redirect "/events/#{event.id}"
end

# Show individual event
get '/events/:id' do
  @event = Event.find(params['id'])
  @absent_members = Member.all.reject do |m|
    @event.has_member?(m.id)
  end
  erb(:'events/show')
end

# Update
post '/events/:id' do
  @event = Event.new(params)
  @event.update
  redirect "/events/#{@event.id}"
end

# Add member
post '/events/:id/add-member' do
  @event = Event.find(params['id'])
  @event.add_member(params['member_id'])
  redirect "/events/#{@event.id}"
end

# Remove member
post '/events/:id/remove-member' do
  @event = Event.find(params['id'])
  @event.remove_member(params['member_id'])
  redirect "/events/#{@event.id}"
end
