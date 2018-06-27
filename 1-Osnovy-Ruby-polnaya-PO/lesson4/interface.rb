#текстовый интерфейс делать следующее:
 #- Создавать станции
 #- Создавать поезда
 #- Создавать маршруты и управлять станциями в нем (добавлять, удалять)
 #- Назначать маршрут поезду
 #- Добавлять вагоны к поезду
 #- Отцеплять вагоны от поезда
 #- Перемещать поезд по маршруту вперед и назад
 #- Просматривать список станций и список поездов на станции
require_relative "info.rb"
class Interface

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def create
    @stations << Station.new("ALmaty")
    @stations << Station.new("Astana")
    @trains << PassengerTrain.new(1)
    @wagons << Wagon.new(1, :pass)
    @trains << CargoTrain.new(2)
    @wagons << Wagon.new(2, :cargo)
    @routes << Route.new(@stations[0], @stations[2], 1)
    @trains[0].set_route(@routes[0])
  end

  def run
    menu
  end

  private

  def menu

    loop do
      puts "_________________"
      puts ASK_LIST_ITEM
      puts MAIN_MENU
      choice = gets.to_i
      case choice
      when 0
        add_station
      when 1
        add_train
      when 2
        add_wagon
      when 3
        add_route
      when 4
        assign_route_train
      when 5
        add_wagon_to_train
      when 6
        remove_wagon_from_train
      when 7
        move_train_back
      when 8
        stations_list
      when 9
        station_trains
      when 10
        exit
      end
    end
  end

  def find_station(name)
    @stations.find { |station| station.name == name }
  end

  def find_train(number)
    @trains.find { |train| train.number == number }
  end

  def find_route(number)
    @routes.find { |route| route.number == number }
  end

  def find_wagon(number)
    @wagons.find(number)
  end

  def stations_list
    puts "_________"
    @stations.each { |station| puts station.name }
  end

  def add_station
    stations_list
    puts 'Введите название станции:'
    station_name = gets.chomp
    station = Station.new(station_name)
    @stations << station
    puts "Станция #{station_name} создано"
  end

  def trains_list
    puts "_________"
    @trains.each { |train| puts train.number }
  end

  def add_train
    trains_list
    puts 'Введите номер поезда:'
    number_train = gets.to_i
    puts "Выберите тип:  1.Пассажирский  2.Грузовой!"
    choice = gets.to_i
    if choice == 1
      @trains << PassengerTrain.new(number_train)
      puts "Пассажирский поезд #{number_train} создан"
    elsif choice == 2
      @trains << CargoTrain.new(number_train)
      puts "Грузовой поезд #{number_train} создан"
    end
  end

  def wagons_list
    puts "_________"
    @wagons.each { |wagon| puts wagon }
  end

  def add_wagon
    wagons_list
    puts "Введите номер вагона"
    number_wagon = gets.to_i
    puts "Выберите тип:  1.Пассажирский  2.Грузовой!"
    choice = gets.to_i
    if choice == 1
      @wagons << Wagon.new(number_wagon, :pass)
      puts "Пассажирский вагон #{number_wagon} создан"
    elsif choice == 2
      @wagons << Wagon.new(number_wagon, :cargo)
      puts "Грузовой вагон #{number_wagon} создан"
    else
      puts UNKNOWN_COMAND
    end
  end

  def add_route
    stations_list
    puts 'Выберите имя первой станций'
    start_station = gets.chomp
    puts 'Выберите имя конечной станций'
    stop_station = gets.chomp
    routes_list
    puts 'Введите номер маршута'
    number_route = gets.to_i
    if number_route == nil || start_station == nil || stop_station == nil
      puts WRONG_ATTR
    else
      @routes << Route.new(start_station, stop_station, number_route)
      puts SUCCESS
    end
  end

  def routes_list
    puts "_________"
    @routes.each { |route| puts route.number }
  end

  def assign_route_train
    routes_list
    puts 'Введите номер маршрута:'
    number_route = gets.to_i
    route = find_route(number_route)
    trains_list
    puts 'Введите номер поезда:'
    number_train = gets.to_i
    train = find_train(number_train)
    if route && train
      @routes << train.set_route(route)
      puts SUCCESS
    else
      puts  UNKNOWN_COMAND
    end
  end

  def add_wagon_to_train
    wagons_list
    puts "Введите номер вагона:"
    number_wagon = gets.to_i
    wagon = find_wagon(number_wagon)
    trains_list
    puts "Введите номер поезда"
    number_train = gets.to_i
    train = find_train(number_train)
    if wagon && train
      @wagons << wagon
    puts SUCCESS
    else
      puts UNKNOWN_COMAND
    end
  end

  def remove_wagon_from_train
    trains_list
    puts 'Введите номер поезда:'
    number_train = gets.to_i
    train = find_train(number_train)
    puts train.wagons
    puts 'Введите номер вагона:'
    number_wagon = gets.to_i
    if train.wagons == number_wagon
      train.wagons - 1
      puts "Вагон успешно отцеплен"
    else
      puts UNKNOWN_COMAND
    end
  end

  def move_train_forward
    trains_list
    puts 'Введите номер поезда:'
    number = gets.to_i
    train = find_train(number)
    if train
      train.go_forward
    else
      puts 'Невозможно переместить поезд по маршруту вперед'
    end
  end

  def move_train_back
    trains_list
    puts 'Введите номер поезда:'
    number = gets.to_i
    train = find_train(number)
    if train
      train.go_back
    else
      puts 'Невозможно переместить поезд по маршруту назад'
    end
  end

  def stations_list
    puts "__Список станций__"
    @stations.each { |station| puts station.name }
  end

  def station_trains
    stations_list
    puts 'Введите имя станции:'
    name_station = gets.chomp
    station = find_station(name_station)
    if station
      puts "Список поездов на станций: #{station.trains}"
    else
      puts 'Такой станции нет'
    end
  end

end
