require_relative 'event'

class Location
  attr_reader :id, :name, :capacity
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name'].downcase
    @capacity = options['capacity'].to_i
  end

  def events
    sql = '
      SELECT e.* from events e
      WHERE e.location_id = $1
      ORDER BY e.start_time ASC'
    results = SqlRunner.run(sql, [@id])
    results = results.map { |e| Event.new(e) }
    return results
  end

  def save
    sql = '
      INSERT INTO locations (name, capacity)
      VALUES ($1, $2)
      RETURNING id'
    values = [@name, @capacity]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def update
    sql = '
      UPDATE locations
      SET (name, capacity) =
      ($1, $2) WHERE id = $3'
    values = [@name, @capacity, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = 'SELECT * from locations WHERE id = $1'
    result = SqlRunner.run(sql, [id])
    return result.first.nil? ? nil : Location.new(result.first)
  end

  def self.all
    sql = '
      SELECT * FROM locations
      ORDER BY name'
    results = SqlRunner.run(sql)
    return results.map { |e| Location.new(e) }
  end

  def self.delete(id)
    sql = 'DELETE FROM locations WHERE id = $1'
    SqlRunner.run(sql, [id])
  end

  def self.delete_all
    sql = 'DELETE FROM locations'
    SqlRunner.run(sql)
  end
end
