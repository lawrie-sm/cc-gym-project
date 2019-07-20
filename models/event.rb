require_relative '../db/sql_runner'
require_relative 'member'

class Event
  attr_reader :id, :name, :description, :time
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @time = options['time']
  end

  def has_member?(member_id)
    current_ids = members.map {|m| m.id.to_i }
    return current_ids.include?(member_id)
  end

  def add_member(member_id)
    sql = '
      INSERT INTO members_events (member_id, event_id)
      VALUES ($1, $2)'
    values = [member_id, @id]
    SqlRunner.run(sql, values)
  end

  def remove_member(member_id)
    sql = '
      DELETE FROM members_events
      WHERE member_id = $1 AND event_id = $2'
    values = [member_id, @id]
    SqlRunner.run(sql, values)
  end

  def members
    sql = '
      SELECT m.* from members m
      INNER JOIN members_events me
        ON me.member_id = m.id
      WHERE me.event_id = $1'
    results = SqlRunner.run(sql, [@id])
    results = results.map { |m| Member.new(m) }
    return results
  end

  def save
    sql = '
      INSERT INTO events (name, description, time)
      VALUES ($1, $2, $3)
      RETURNING id'
    values = [@name, @description, @time]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.find(id)
    sql = 'SELECT * from events WHERE id = $1'
    result = SqlRunner.run(sql, [id])
    return result.first.nil? ? nil : Event.new(result.first)
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
