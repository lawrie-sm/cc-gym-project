require_relative '../db/sql_runner'

class Member
  attr_reader :id, :name, :membership
  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @membership = options['membership']
  end
end
