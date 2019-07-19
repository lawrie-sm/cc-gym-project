require '../db/sql_runner'

class Member
  attr_reader :id, :name
  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @membership = options['membership']
  end
end
