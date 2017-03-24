class Journey

MINIMUM_FARE = 1

  attr_reader :entry_station
  attr_writer :entry_station

  def start(start_station)
    @entry_station = start_station
  end

  def finish(finish_station)
    journey = {entry_station => finish_station}
    @entry_station = nil
    journey
  end

  def fare(trip)
    MINIMUM_FARE
  end

end
