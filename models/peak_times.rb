class PeakTimes
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
end
