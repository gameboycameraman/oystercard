class Oystercard

TOP_UP_LIMIT = 90

attr_reader :balance, :list_of_journeys, :journey

  def initialize
    @balance = 0
    @journey = Journey.new
    @list_of_journeys = []
  end

  def top_up(money)
    raise "Maximum limit of £#{TOP_UP_LIMIT} exceeded" if balance + money > TOP_UP_LIMIT
    self.balance = balance + money
  end

  def touch_in(station_name)
    fail "Sorry love, I want more money" if balance < Journey::MINIMUM_FARE
    journey.start(station_name)
  end

  def touch_out(leaving_station)
    trip = journey.finish(leaving_station)
    list_of_journeys << trip
    deduct(journey.fare(trip))
  end

  def in_journey?
    !journey.is_complete?
  end

  private

  attr_writer :balance, :list_of_journeys, :journey

  def deduct(amount)
    self.balance -= amount
  end

end
