class Train
  attr_reader :number, :type, :wagons, :speed

  def initialaize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def add_wagon(wagon)
    if speed.zero?
      @wagons << wagon
    else
      puts 'Нельзя прицепить вагон когда поезд движется'
    end
  end

  def remove_wagon(wagon)
    if @wagons.include?(wagon) && speed == 0
      @wagons.delete(wagon)
    else
      puts 'Нельзя отцепить вагон - так как в базе может быть нет такого ВАГОНА или поезд не остановился еще'
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
      puts "Значение в маршруте не существует, сперва нужно задать маршут поезду"
    end
  end

  def current_station
    @route.stations[@current_index]
  end

  def prev_station
    if current_station != @route.start_station
      @route.stations[@current_index - 1]
    else
      puts "Это первая станция"
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
      puts "Не возможно движение назат, так как это первая станция"
    end
  end

  def speed_up
    @speed += 1
  end

  def slow_down
    @speed -= 1 if speed != 0
  end
end
