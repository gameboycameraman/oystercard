require 'journey'


describe Journey do
subject(:journey) {described_class.new}

let(:station) {double :station}

  describe "#start" do

    # in order to be correctly charged
    # as a customer
    # record entry station

    it "assigns an entry station" do
      journey.start(station)
      expect(journey.station).to eq station
    end

  end

end
