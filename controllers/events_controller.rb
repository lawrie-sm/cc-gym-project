require_relative '../models/event'

get '/events' do
  @events = Event.all
  erb(:'events/index')
end
