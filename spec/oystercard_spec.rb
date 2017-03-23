require "oystercard"

describe Oystercard do
  subject(:oystercard) {described_class.new}
  maximum_amount = Oystercard::TOP_UP_LIMIT
  let (:entry_station) { double(:entry_station) }
  let (:exit_station) { double(:exit_station)}

  let (:fake_entry_station) {double(:station)}
  let (:fake_exit_station) {double(:station)}


  describe "# Balance - Top Up" do

    it "want a default balance of 0 on the card" do
      expect(oystercard.balance).to eq 0
    end

    it "add money to the balance" do
      oystercard.top_up(90)
      expect(oystercard.balance).to eq 90
    end

    it "raises error when maximum limit #{Oystercard::TOP_UP_LIMIT} is exceeded" do
      oystercard.top_up(maximum_amount)
      expect{ oystercard.top_up(1) }.to raise_error "Maximum limit of £#{maximum_amount} exceeded"
    end

  end


  describe "# Touch In" do

    it "changes in_journey to true when touching in" do
      oystercard.top_up(maximum_amount)
      oystercard.touch_in(fake_entry_station)
      expect(oystercard.in_journey?).to eq true
    end

    it "save the entry station when touch_in" do
      oystercard.top_up(maximum_amount)
      oystercard.touch_in(fake_entry_station)
      expect(oystercard.current_journey.entry_station).to eq (fake_entry_station)
    end

    it "raises error is unsufficient funds when touch_in" do
      expect { oystercard.touch_in(entry_station) }.to raise_error "Sorry love, I want more money"
    end

    it 'deducts penalty fare on touch_in if there already is an entry station' do
      oystercard.top_up 10
      oystercard.touch_in(entry_station)
      expect {oystercard.touch_in(entry_station)}.to change{oystercard.balance}.by -6
    end

  end


  describe "# Touch out" do

    it "deduct a fare from the card when touch out" do
      oystercard.top_up(maximum_amount)
      oystercard.touch_in(fake_entry_station)
      oystercard.touch_out(fake_exit_station)
      expect(oystercard.balance).to eq maximum_amount - oystercard.current_journey.fare
    end

    it "changes in_journey to false when touching out" do
      oystercard.top_up(maximum_amount)
      oystercard.touch_in(fake_entry_station)
      oystercard.touch_out(fake_exit_station)
      expect(oystercard.in_journey?).to eq false
    end

    it "forgets the station entry when touch_out" do
      oystercard.top_up(maximum_amount)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.entry_station).to eq nil
    end

    it "charges penalty fare on touch out if no touch in" do
      expect {oystercard.touch_out(exit_station)}.to change{oystercard.balance}.by -6
    end

  end


  describe "# In Journey" do

    it "has an empty list of journeys by default" do
      expect(oystercard.journeys).to be_empty
    end

    it "checks if card is in journey" do
      oystercard.top_up(maximum_amount)
      oystercard.touch_in(fake_entry_station)
      expect(oystercard.in_journey?).to eq true
    end

    it "creates a journey when touching in and out" do
      oystercard.top_up(maximum_amount)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journeys).to include(entry_station => exit_station)
    end

  end

end
