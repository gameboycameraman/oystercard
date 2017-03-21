class Oystercard

TOP_UP_LIMIT = 90
attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise "Maximum limit of £#{TOP_UP_LIMIT} exceeded" if balance + money > TOP_UP_LIMIT
    self.balance = balance + money
  end

  private

  attr_writer :balance

end
