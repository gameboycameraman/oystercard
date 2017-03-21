class Oystercard

TOP_UP_LIMIT = 90
FARE = 2.40
attr_reader :balance, :travelling

  def initialize
    @balance = 0
    @travelling = false
  end

  def top_up(money)
    raise "Maximum limit of £#{TOP_UP_LIMIT} exceeded" if balance + money > TOP_UP_LIMIT
    self.balance = balance + money
  end



  def touch_in
    fail "Sorry love, I want more money" if balance < FARE
    self.travelling = true
  end

  def touch_out
    deduct
    self.travelling = false
  end

  def in_journey?
    travelling
  end

  private

  attr_writer :balance, :travelling

  def deduct
    self.balance -= FARE
  end

end
