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
  @absent_members = Member.all.map do |m|
    m.id
  end
  erb(:'events/show')
end

post '/events/:id/add-member' do
  @event = Event.find(params['id'])
  @event.add_member(params['member_id'])
  redirect "/events/#{@event.id}"
end

post '/events/:id/remove-member' do
  @event = Event.find(params['id'])
  @event.remove_member(params['member_id'])
  redirect "/events/#{@event.id}"
end
