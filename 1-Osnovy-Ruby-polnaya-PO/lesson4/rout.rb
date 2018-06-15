class Route
  attr_reader :stations, :number

  def initialaize(number, start_station, stop_station)
    @stations = [start_station, stop_station]
    @number = number
  end

  def start_station
    @stations[0]
  end

  def stop_station
    @stations[-1]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    immutable_stations = [start_station, stop_station]
    if immutable_stations.include?(station)
      puts "Нелзя из базы удалять начальную и конечную станцию!"
    else
      @stations.delete(station)
    end
  end

  def print_stations
    @stations.each { |station| puts station.name }
  end
end
