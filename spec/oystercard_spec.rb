require "oystercard"

describe Oystercard do
  subject(:oystercard) {described_class.new}
  # In order to use public transport
  # As a customer
  # I want money on my card

  it "want a default balance of 0 on the card" do
    expect(oystercard.balance).to eq 0
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card

  it "add money to the balance" do
    oystercard.top_up(100)
    expect(oystercard.balance).to eq 100
  end

end
