require 'sinatra'
require 'sinatra/reloader'
also_reload './models/*', './controllers/*'
require_relative 'controllers/locations_controller'
require_relative 'controllers/members_controller'
require_relative 'controllers/events_controller'

get '/' do
  erb(:index)
end
