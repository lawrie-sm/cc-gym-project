require_relative '../db/sql_runner'

class Event
  attr_reader :id, :name, :description, :time
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @time = options['time']
  end

  def save
    sql = '
    INSERT INTO events (name, description, time)
    VALUES ($1, $2, $3)
    RETURNING id'
    values = [@name, @description, @time]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end
end
