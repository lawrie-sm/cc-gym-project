require_relative '../db/sql_runner'
require_relative 'event'

class Member
  attr_reader :id, :first_name, :last_name, :membership
  def initialize(options)
    @id = options['id'] if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @membership = options['membership']
  end

  def events
    sql = '
      SELECT e.* from events e
      INNER JOIN members_events me
        ON me.event_id = e.id
      WHERE me.member_id = $1'
    results = SqlRunner.run(sql, [@id])
    results = results.map { |m| Event.new(m) }
    return results
  end

  def save
    sql = '
      INSERT INTO members (first_name, last_name, membership)
      VALUES ($1, $2, $3)
      RETURNING id'
    values = [@first_name, @last_name, @membership]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.find(id)
    sql = 'SELECT * from members WHERE id = $1'
    result = SqlRunner.run(sql, [id])
    return result.first.nil? ? nil : Member.new(result.first)
  end

  def self.all
    sql = 'SELECT * FROM members'
    results = SqlRunner.run(sql)
    return results.map { |e| Member.new(e) }
  end

  def self.delete(id)
    sql = 'DELETE FROM members WHERE id = $1'
    SqlRunner.run(sql, [id])
  end

  def self.delete_all
    sql = 'DELETE FROM members'
    SqlRunner.run(sql)
  end
end
