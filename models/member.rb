require_relative '../db/sql_runner'

class Member
  attr_reader :id, :name, :membership
  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @membership = options['membership']
  end

  def save
    sql = '
    INSERT INTO members (name, membership)
    VALUES ($1, $2)
    RETURNING id'
    values = [@name, @membership]
    @id = SqlRunner.run(sql, values).first['id'].to_i
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
