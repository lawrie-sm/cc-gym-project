require_relative '../models/event'

get '/events' do
  @events = Event.all
  erb(:'events/index')
end

get '/events/:id' do
  @event = Event.find(params['id'])
  erb(:'events/show')
end
