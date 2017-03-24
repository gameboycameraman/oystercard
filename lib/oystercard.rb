class Oystercard

TOP_UP_LIMIT = 90

attr_reader :balance, :list_of_journeys, :journey

  def initialize
    @balance = 0
    @journey = Journey.new
    @list_of_journeys = []
  end

  def top_up(money)
    raise "Maximum limit of £#{TOP_UP_LIMIT} exceeded" if top_up_too_high?(money)
    self.balance = balance + money
  end


  def touch_in(station_name)
    fail "Sorry love, I want more money" if balance_too_low?
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

  def balance_too_low?
    balance < Journey::MINIMUM_FARE
  end

  def top_up_too_high?(money)
    balance + money > TOP_UP_LIMIT
  end

  def deduct(amount)
    self.balance -= amount
  end

end
