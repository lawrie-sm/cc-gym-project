require_relative '../db/sql_runner'

class Event
  attr_reader :id, :name, :description, :time
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @time = options['time']
  end

  def add_member(member)
    sql = '
      INSERT INTO members_events (member_id, event_id)
      VALUES ($1, $2)'
    values = [member.id, @id]
    SqlRunner.run(sql, values)
  end

  def save
    sql = '
      INSERT INTO events (name, description, time)
      VALUES ($1, $2, $3)
      RETURNING id'
    values = [@name, @description, @time]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.all
    sql = 'SELECT * FROM events'
    results = SqlRunner.run(sql)
    return results.map { |e| Event.new(e) }
  end

  def self.delete(id)
    sql = 'DELETE FROM events WHERE id = $1'
    SqlRunner.run(sql, [id])
  end

  def self.delete_all
    sql = 'DELETE FROM events'
    SqlRunner.run(sql)
  end
end
