class Journey

  attr_reader :entry_station
  attr_writer :entry_station

  def start(start_station)
    @entry_station = start_station
  end

end
