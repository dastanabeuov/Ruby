class Station
  attr_reader :name, :trains

  def initialaize(name)
    @name = name
    @trains = []
  end

  def set_train(train)
    @trains << train
  end

  def get_train(type)
    @trains.select { |train| train.type == type}
  end

  def send_train(train)
    if trains.include?(train)
      @trains.delete(train)
    else
      puts "Нет в базе данных!"
    end
  end
end

class Route
  attr_reader :stations

  def initialaize(start_station, stop_station)
    @stations = [start_station, stop_station]
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
    if @stations[0, -1].include?(station)
      puts "Нелзя из базы удалять начальную и конечную станцию!"
    else
      @stations.delete(station)
    end
  end

  def print_station
    stations.each { |station| puts station }
  end
end

class Train
  attr_reader :number, :type, :wagons, :speed

  def initialaize(number, type, wagons, speed)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def speed_up
    @speed += 1
  end

  def slow_down
    @speed -= 1 if speed != 0 
  end

  def add_wagon
      @wagons += 1 if self.speed == 0
  end

  def remove_wagon
    if slow_down == 0 && wagons > 0
      @wagons -= 1
    else
      puts "Ne vizmozhno otceplyat vagon tak kak poezd dvijetsa"
    end
  end

##########################################################################
  def in_route(route)
    @route = route
    start_station = @route.stations(route)
    start_station.add_station(self)
    @current_index = 0
  end

  def next_station
    @route.stations[@current_index + 1]
  end

  def current_station
    @route.stations[@current_index]
  end

  def prev_station
    @route.stations[@current_index - 1]
  end

  def forward
    current_station.delete_train(self)
    next_station.add_train(self)
    @current_index += 1
  end

  def go_back
    current_station.delete_train(self)
    next_station.add_train(self)
    @current_index -= 1
  end

end
