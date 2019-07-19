require 'sinatra'
require 'sinatra/contrib'
also_reload './models/*'

get '/' do
  erb(:index)
end
