class Oystercard

attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    self.balance = balance + money
  end

  private

  attr_writer :balance
  
end
