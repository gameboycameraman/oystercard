class Oystercard

TOP_UP_LIMIT = 90
FARE = 1
attr_reader :balance, :entry_station, :journeys, :current_journey

  def initialize
    @balance = 0
    #@entry_station = nil
    @journeys = []
    @current_journey = nil
  end

  def top_up(money)
    raise "Maximum limit of £#{TOP_UP_LIMIT} exceeded" if balance + money > TOP_UP_LIMIT
    self.balance = balance + money
  end

  def touch_in(station_name)
    fail "Sorry love, I want more money" if balance < FARE
    @current_journey = Journey.new(station_name)
    #self.entry_station = station_name
  end

  def touch_out(leaving_station)
    deduct
    journeys << {entry_station => leaving_station}
    self.entry_station = nil
  end

  def in_journey?
    !!current_journey.entry_station
  end

  private

  attr_writer :balance, :entry_station,

  def deduct
    self.balance -= FARE
  end

end
