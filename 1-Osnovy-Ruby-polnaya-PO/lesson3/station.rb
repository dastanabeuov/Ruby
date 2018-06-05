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
    trains.each do |poezd| if poezd == type
      puts type
    else
      puts "Net v base dannyh!"
    end
  end

  def send_train(train)
    if trains.include?(train)
      @trains.delete(train)
    else
      puts "Нет в базе данных!"
    end
  end

class Route
  attr_reader :stations

  def initialaize(start_station, stop_station)
    @stations = [start_station, stop_station]
  end

  def start_station
    stations = [0]
  end

  def stop_station
    stations = [-1]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    if [start_station, stop_station].include?(station)
      puts "Нелзя из базы удалять начальную и конечную станцию!"
    else
      @stations.delete(station)
    end
  end

  def print_station
    stations.each { |element| puts element }
  end

class Train
  attr_reader :number , :type, :wagons, :speed

  def initialaize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
  end

  def start
    @speed += 1
  end

  def stop
    @speed -= 1 
  end

  def current_speed
    speed
  end

  def number_of_wagons
    wagons.count
  end

  def add_wagon
    if stop
      @wagons + 1
    else
      puts "Ne mozhet pricepit tak kak poezd dvijetsa"
    end
  end

  def remove_wagon
    if stop && wagons > 0
      @wagons - 1
    else
      puts "Ne vizmozhno otceplyat vagon tak kak poezd dvijetsa"
    end
  end

##########################################################################
  def in_route(route)
    @route = route
    @rout_index = 0
    add_station(@rout_index)
  end
end
