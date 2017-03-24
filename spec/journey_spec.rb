require 'journey'


describe Journey do
subject(:journey) {described_class.new}

let(:start_station) {double :station}

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
      expect(journey.entry_station).to be_nil
    end
  end

end
