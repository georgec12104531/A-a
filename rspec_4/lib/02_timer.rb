
class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    @hours = seconds / 3600
    @minutes = (seconds % 3600) / 60
    @seconds = seconds % 60
    padded(@hours, @minutes, @seconds)
  end

  def padded(*times)
    times.map.with_index do |time, i|
      current_time = String(time)
      if current_time.length == 1
        "0#{current_time}"
      else
        current_time
      end
    end.join(":")
  end
end
