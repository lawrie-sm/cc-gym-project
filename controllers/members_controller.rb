require_relative '../models/member'

get '/members' do
  @members = Member.all
  erb(:'members/index')
end
