class Train
  attr_reader :number, :type, :wagons, :speed

  def initialaize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
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
    route.start_station.handle_train_arrival(self)
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
    if prev_station 
      current_station.send_train(self)
      prev_station.handle_train_arrival(self)
      @current_index -= 1
    else
      puts "Nevozmozhno nazat"
    end
  end

  protected
  
  def speed_up
    @speed += 1
  end

  def slow_down
    @speed -= 1 if speed != 0
  end
end
