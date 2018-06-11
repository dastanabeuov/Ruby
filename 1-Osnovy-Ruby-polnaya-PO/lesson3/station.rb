class Station
  attr_reader :name, :trains

  def initialaize(name)
    @name = name
    @trains = []
  end

  def handle_train_arrival(train)
    @trains << train
  end

  def get_trains_by_type(type)
    @trains.select { |train| train.type == type }
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

  def delete_station=(station)
    combo = [start_station, stop_station]
    if combo.include?(station)
      puts "Нелзя из базы удалять начальную и конечную станцию!"
    else
      @stations.delete(station)
    end
  end

  def print_stations
    @stations.each { |station| puts station.name }
  end
end

class Train
  attr_reader :number, :type, :wagons, :speed

  def initialaize(number, type, wagons)
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
    @wagons += 1 if speed == 0
  end

  def remove_wagon
    if @speed == 0 && wagons > 0
      @wagons -= 1
    else
      puts "Ne vizmozhno otceplyat vagon tak kak poezd dvijetsa"
    end
  end

  def set_route(route)
    @route = route
    start_station = @route.stations.first
    start_station.add_station(self)
    @current_index = 0
  end

  def next_station
    if route
      @route.stations[@current_index + 1]
    else
      puts "Znachenya marshruta otsutstvuet"
    end
  end

  def current_station
    @route.stations[@current_index]
  end

  def prev_station
    if current_station != @route.start_station
      @route.stations[@current_index - 1]
    else
      puts "eto pervaya stancy"
    end
  end

  def go_forward
    current_station.send_train(self)
    next_station.handle_train_arrival(self)
    @current_index += 1
  end

  def go_back
    if current_station.send_train(self)
      prev_station.handle_train_arrival(self)
      @current_index -= 1
      current_station.handle_train_arrival(self)
    else
      puts "Nevozmozhno nazat"
    end
  end
end
