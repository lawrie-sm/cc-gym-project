require_relative '../db/sql_runner'

class Event
  attr_reader :id, :name, :description, :time
  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @description = options['description']
    @time = options['time']
  end
end
