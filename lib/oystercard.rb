class Oystercard

TOP_UP_LIMIT = 90
FARE = 2.40
attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = {}
  end

  def top_up(money)
    raise "Maximum limit of £#{TOP_UP_LIMIT} exceeded" if balance + money > TOP_UP_LIMIT
    self.balance = balance + money
  end

  def touch_in(station_name)
    fail "Sorry love, I want more money" if balance < FARE
    self.entry_station = station_name
  end

  def touch_out(leaving_station)
    deduct
    self.exit_station = leaving_station
    journeys[entry_station] = exit_station
    self.entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  attr_writer :balance, :entry_station, :exit_station

  def deduct
    self.balance -= FARE
  end

end
