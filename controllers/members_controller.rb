require_relative '../models/member'

# Index
get '/members' do
  @members = Member.all
  erb(:'members/index')
end

# New member form
get '/members/new' do
  erb(:'members/new')
end

# Edit member form
get '/members/:id/edit' do
  @member = Member.find(params['id'])
  erb(:'/members/edit')
end

# Show individual member
get '/members/:id' do
  @member = Member.find(params['id'])
  erb(:'members/show')
end

# Create new member
post '/members' do
  member = Member.new(params)
  member.save
  redirect "/members/#{member.id}"
end

# Post to update member
post '/members/:id' do
  member = Member.new(params)
  member.update
  redirect "/members/#{member.id}"
end

# Post to delete member
post '/members/:id/delete' do
  Member.delete(params['id'])
  redirect "/members"
end
