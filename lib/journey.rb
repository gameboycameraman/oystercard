class Journey

  FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station

  def initialize(entry_station)
    @entry_station = entry_station
  end

  def fare
      entry_station.nil? ? FARE : PENALTY_FARE
  end

end
