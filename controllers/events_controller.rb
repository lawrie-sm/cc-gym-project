require_relative '../models/event'

get '/events' do
  @events = Event.all
  erb(:'events/index')
end

get '/events/new' do
  erb(:'events/new')
end

post '/events' do
  event = Event.new(params)
  event.save
  redirect "/events/#{event.id}"
end

get '/events/:id' do
  @event = Event.find(params['id'])
  @all_members = Member.all
  erb(:'events/show')
end

post '/events/:id/add-member' do
  @event = Event.find(params['id'])
  @member = Member.find(params['member_id'])
  @event.add_member(@member)
  redirect "/events/#{@event.id}"
end
