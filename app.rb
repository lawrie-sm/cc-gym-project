require 'sinatra'
require 'sinatra/reloader'
also_reload './models/*'
require_relative 'controllers/members_controller'

get '/' do
  erb(:index)
end
