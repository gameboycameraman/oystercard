require 'journey'


describe Journey do
subject(:journey) {described_class.new}

let(:start_station) {double :s_station}
let(:finish_station) {double :f_station}

  describe "#start" do
    # in order to be correctly charged
    # as a customer
    # record entry station
    it "records an entry station" do
      journey.start(start_station)
      expect(journey.entry_station).to eq start_station
    end
  end

  describe "#finish" do
    # in order to be correctly charged
    # as a customer
    # record exit station
    it "resets the entry_station to nil" do
      journey.start(start_station)
      journey.finish(finish_station)
      expect(journey.entry_station).to eq nil
    end

    it "output the journey data" do
      journey.start(start_station)
      expect(journey.finish(finish_station)).to eq ({start_station => finish_station})
    end
  end

  describe "#fare" do
    # in order to be correctly charged
    # as a customer
    # calculate the correct fare

    it "returns the minimum fare" do
      journey.start(start_station)
      trip = journey.finish(finish_station)
      expect(journey.fare(trip)).to eq Journey::MINIMUM_FARE
    end

    it "returns the penalty fare if no entry" do
      unfinished_trip = journey.finish(finish_station)
      expect(journey.fare(unfinished_trip)).to eq Journey::PENALTY_FARE
    end

  end

  describe "#is_complete?" do
    # in order to be correctly charged
    # as a customer
    # returns whether or not journey is complete?
    it "returns false if journey started, but not finished" do
      journey.start(start_station)
      expect(journey.is_complete?).to eq false
    end

    it "returns true if journey started and finished" do
      journey.start(start_station)
      journey.finish(finish_station)
      expect(journey.is_complete?).to eq true
    end


  end


end
