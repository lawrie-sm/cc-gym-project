require_relative '../models/member'

get '/members' do
  @members = Member.all
  erb(:'members/index')
end

get '/members/new' do
  erb(:'members/new')
end

post '/members' do
  member = Member.new(params)
  member.save
  redirect "/members/#{member.id}"
end

get '/members/:id' do
  @member = Member.find(params['id'])
  erb(:'members/show')
end
