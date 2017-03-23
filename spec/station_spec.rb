require "station"

describe Station do

  subject(:station) {described_class.new("Highbury", 2)}

  it "has a station name" do
    expect(station.station_name).to eq "Highbury"
  end

  it "has a station zone" do
    expect(station.station_zone).to eq 2
  end


end
