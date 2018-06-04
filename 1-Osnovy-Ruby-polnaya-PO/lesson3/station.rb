class Station
  attr_accessor :name, :train

  def initialaize(name)
    @name = name
    @trains = []
  end

  def set_train(train)
    @trains << train
  end

  def all_trains_in_station
    @trains
  end

  def get_type_train(type)
    @trains.count { |train| train == train.type }
  end

  def send_train(train)
    if @trains.include?(train)
      @trains.delete(train)
    else
      puts "Нет в базе данных!"
  end
end

class Route
  attr_accessor :stations

  def initialaize(start_station, stop_station)
    @start_station = start_station
    @stop_station = stop_station
    @stations = [start_station, stop_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    if station != @stations[0,-1]
      @stations.delete(station)
    else
      puts "Нелзя из базы удалять начальную и конечную станцию!"
  end

  def print_stations
    @stations
  end
end

class Train
  attr_accessor :number , :type, :count, :speed

  def initialaize(number, type, count)
    @number = number
    @type = type
    @count = count
  end

  def start
    @speed += (1..10).step(2).sleep(2)
  end

  def current_speed
    @speed
  end

  def stop
    @speed = (10..0).step(2).sleep(2) 
  end

  def count_train
    @count
  end

  def add_count_train
    if @speed == 0
      @count += 1
    else
      puts "Не может прицеплять"
    end
  end

  def delete_count_train
    if @speed == 0 && @count > 0
      @count.delete(1)
    else
      puts "Не может отцеплять"
    end
  end
end
