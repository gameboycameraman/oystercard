class Oystercard

TOP_UP_LIMIT = 90

attr_reader :balance, :journeys, :current_journey, :entry_station

  def initialize
    @balance = 0
    @journeys = []
    @current_journey = Journey.new(nil)
  end

  def top_up(money)
    raise "Maximum limit of £#{TOP_UP_LIMIT} exceeded" if balance + money > TOP_UP_LIMIT
    self.balance = balance + money
  end

  def touch_in(station_name)
    fail "Sorry love, I want more money" if balance < current_journey.fare
    if current_journey.entry_station != nil
      deduct
    else
      @current_journey = Journey.new(station_name)
    end
  end

  def touch_out(leaving_station)
    if current_journey.entry_station == nil
     deduct
     journeys << "PENALTY FARE"
     puts "You fought the law and the law won"
   else
     journeys << {current_journey.entry_station => leaving_station}
     self.current_journey = Journey.new(nil)
     deduct
   end
  end

  def in_journey?
    !!current_journey.entry_station
  end

  def deduct
    self.balance -= current_journey.fare
  end

  private

  attr_writer :balance, :current_journey



end
