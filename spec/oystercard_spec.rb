require "oystercard"

describe Oystercard do
  subject(:oystercard) {described_class.new}

  it "want a default balance of 0 on the card" do
    expect(oystercard.balance).to eq 0
  end

  it "add money to the balance" do
    oystercard.top_up(90)
    expect(oystercard.balance).to eq 90
  end

  it "raises error when maximum limit #{Oystercard::TOP_UP_LIMIT} is exceeded" do
    maximum_amount = Oystercard::TOP_UP_LIMIT
    oystercard.top_up(maximum_amount)
    expect{ oystercard.top_up(1) }.to raise_error "Maximum limit of £#{maximum_amount} exceeded"
  end
end
