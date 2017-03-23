require 'journey'

describe Journey do

subject(:journey) {described_class.new("Highbury")}

  it 'has an entry_station' do
    expect(journey.entry_station).to eq "Highbury"
  end

end
