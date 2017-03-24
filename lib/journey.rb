class Journey

MINIMUM_FARE = 1
PENALTY_FARE = 6

  attr_reader :entry_station
  attr_writer :entry_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
  end

  def start(start_station)
    # if @entry_station != nil
    #   method_name
    #   fail "You never touched out!"
    # end
    fare({nil => nil}) if entry_station != nil
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

  def is_complete?
    !entry_station
    # same as entry_station.nil?
  end

  private

  def entry_station_reset
    @entry_station = nil
  end

end
