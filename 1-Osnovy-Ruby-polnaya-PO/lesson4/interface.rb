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
  attr_reader :trains, :stations, :wagons, :routes

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
    puts "---------------------"
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
      assign_route
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

  def add_station
    puts "Список станций: #{@stations}"
    puts 'Введите название станции:'
    station_name = gets.chomp
    station = Station.new(station_name)
    @stations << station
    puts "Станция #{@stations} создано"
  end

  def add_train
    puts "Список поездов: #{@trains}"
    puts "Выберите тип:  1.Пассажирский  2.Грузовой!"
    choice = gets.to_i
    puts 'Введите номер поезда:'
    number_train = gets.to_i
    if choice == 1
      @trains << PassengerTrain.new(number_train)
      puts "Пассажирский поезд #{@trains} создан"
    elsif choice == 2
      @trains << CargoTrain.new(number_train)
      puts "Грузовой поезд #{@trains} создан"
    end
  end

  def add_wagon
    puts "Список вагонов: #{@wagons}"
    puts "Введите номер вагона"
    number_wagon = gets.to_i
    puts "Выберите тип:  1.Пассажирский  2.Грузовой!"
    choice = gets.to_i
    if choice == 1
      @wagons << Wagon.new(number_wagon, :pass)
    elsif choice == 2
      @wagons << Wagon.new(number_wagon, :cargo)
    else
      puts ERRORE
    end
  end

  def add_route
    puts "Список маршрутов: #{@routes}"
    puts 'Введите имя первой станций'
    start_station = gets.chomp
    puts 'Введите имя конечной станций'
    stop_station = gets.chomp
    puts 'Введите номер маршута'
    number_route = gets.to_i
    if number_route == @routes
      puts WRONG_ATTR
    else
      @routes << Route.new(start_station, stop_station, number_route)
      puts SUCCESS
    end
  end

  def assign_route
    puts "Список поездов: #{@trains}"
    puts 'Введите номер поезда:'
    number_train = gets.to_i
    train = find_train(number_train)
    puts "Список маршрутов: #{@routes}"
    puts 'Введите номер маршрута:'
    number_route = gets.to_i
    route = find_route(number_route)
    if route && train
      @trains << train
      @stations << route
      puts "Маршут успешно задан текущему поезду"
    else
      puts 'Невозможно назначить маршрут поезду'
    end
  end

  def add_wagon_to_train
    puts "Список вагонов: #{@wagons}"
    puts "Введите номер вагона:"
    number_wagon = gets.to_i
    wagon = find_wagon(number_wagon)
    puts "Список поездов: #{@trains}"
    puts "Введите номер поезда"
    number_train = gets.to_i
    train = find_train(number_train)
    puts "Выберите тип:  1.Пассажирский  2.Грузовой!"
    choice = gets.to_i
    if choice == 1 && wagon && train
      @trains << PassengerTrain.new(number_wagon)
      puts "Пассажирский ВАГОН добавлен"
    elsif choice == 2 && wagon && train
      @trains << CargoTrain.new(number_wagon)
      puts "Грузовой ВАГОН добавлен"
    else
      puts WRONG_ATTR
    end
  end

  def remove_wagon_from_train
    puts "Список вагонов: #{@wagons}"
    puts 'Введите номер вагона:'
    number_wagon = gets.to_i
    wagon = find_wagon(number_wagon)
    puts "Список поездов: #{@trains}"
    puts 'Введите номер поезда:'
    number_train = gets.to_i
    train = find_train(number_train)
    if train && wagon
      @wagons.delete(wagon)
      puts "Вагон успешно отцеплен"
      puts "#{@wagons}"
    else
      puts ERRORE
    end
  end

  def move_train_forward
    puts "Список поездов: #{@trains}"
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
    puts "Список поездов: #{@trains}"
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
    puts "Список станций"
    @stations.each { |station| puts station.name }
  end

  def station_trains
    puts "Список станций: #{@stations}"
    puts 'Введите имя станции:'
    name_station = gets.chomp
    station = find_station(name_station)
    if station
      puts "Список поездов на станций: #{@stations}"
    else
      puts 'Такой станции нет'
    end
  end

end
