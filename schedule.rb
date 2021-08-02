class Schedule
  attr_accessor :weekday, :start_hour, :end_hour, :description

  def initialize(weekday: , start_hour: , end_hour:, description: nil )
    self.weekday = weekday
    self.start_hour = start_hour
    self.end_hour = end_hour
    self.description = description
  end
end
