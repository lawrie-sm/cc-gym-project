class TimeUtils
  def self.within_peak_times?(t)
    peak_times = [
      Range.new(
        Time.new(t.year, t.month, t.day, 12),
        Time.new(t.year, t.month, t.day, 14)
      ),
      Range.new(
        Time.new(t.year, t.month, t.day, 17),
        Time.new(t.year, t.month, t.day, 19)
      )
    ]

    peak = false
    peak_times.each do |p|
      peak = true if p.include?(t)
    end
    return peak
  end

  def self.get_recurring_times(start_time, recurrence)
    time = Time.parse(start_time)
    date = time.to_date
    dates = [date]

    case recurrence
    when 'daily'
      365.times do
        date = date.next_day
        dates.push(date)
      end
    when 'weekly'
      52.times do
        date += 7
        dates.push(date)
      end
    when 'monthly'
      12.times do
        date = date.next_month
        dates.push(date)
      end
    end

    times = dates.map do |d|
      Time.new(d.year, d.month, d.day, time.hour, time.min)
    end

    return times
  end
end
