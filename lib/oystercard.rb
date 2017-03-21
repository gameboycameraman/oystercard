class Oystercard

TOP_UP_LIMIT = 90
FARE = 2.40
attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    raise "Maximum limit of £#{TOP_UP_LIMIT} exceeded" if balance + money > TOP_UP_LIMIT
    self.balance = balance + money
  end

  def deduct
    self.balance = balance - FARE
  end

  def touch_in
    self.in_journey = true
  end

  def touch_out
    self.in_journey = false
  end

  def in_journey?
    in_journey
  end

  private

  attr_writer :balance, :in_journey

end
