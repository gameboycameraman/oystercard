class Journey

MINIMUM_FARE = 1
PENALTY_FARE = 6

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
    return PENALTY_FARE if trip.all? { |k, v| k.nil? || v.nil?}
    MINIMUM_FARE
  end

end
