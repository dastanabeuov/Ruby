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
require_relative "exeption.rb"
class Interface
  include Exeption

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def create
    @stations << Station.new("ALmaty")
    @stations << Station.new("Astana")
    @trains << PassengerTrain.new("qqq-11")
    @wagons << PassengerWagon.new("qqq-22")
    @trains << CargoTrain.new("www-11")
    @wagons << CargoWagon.new("www-22")
    @routes << Route.new(@stations[0], @stations[-1], 1)
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
        move_train
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
    @wagons.find { |wagon| wagon.number == number }
  end

  def stations_list
    puts "_________"
    @stations.each { |station| puts station.name }
  end

  def add_station
    stations_list
    puts 'Введите название станции:'
    station_name = gets.chomp
    @stations << Station.new(station_name)
    puts "Станция #{station_name} создано"
  rescue RuntimeError => error
    puts "Ошибка: #{error.message}"
    retry
  end

  def trains_list
    puts "_________"
    @trains.each { |train| puts train.number }
  end

  def add_train
    trains_list
    puts 'Введите номер поезда:'
    number_train = gets.chomp
    puts "Выберите тип:  1.Пассажирский  2.Грузовой!"
    choice = gets.to_i
    if choice == 1
      @trains << PassengerTrain.new(number_train)
      puts "Пассажирский поезд #{number_train} создан"
    elsif choice == 2
      @trains << CargoTrain.new(number_train)
      puts "Грузовой поезд #{number_train} создан"
    end
  rescue RuntimeError => error
    puts "Ошибка: #{error.message}"
    retry
  end

  def wagons_list
    puts "_________"
    @wagons.each { |wagon| puts wagon.number }
  end

  def add_wagon
    wagons_list
    puts "Введите номер вагона"
    number_wagon = gets.chomp
    puts "Выберите тип:  1.Пассажирский  2.Грузовой!"
    choice = gets.to_i
    if choice == 1
      @wagons << PassengerWagon.new(number_wagon)
      puts "Пассажирский вагон #{number_wagon} создан"
    elsif choice == 2
      @wagons << CargoWagon.new(number_wagon)
      puts "Грузовой вагон #{number_wagon} создан"
    else
      puts UNKNOWN_COMAND
    end
  rescue RuntimeError => error
    puts "Ошибка: #{error.message}"
    retry
  end

  def add_route
    stations_list
    puts 'Выберите имя первой станций'
    start_station = gets.chomp
    start = find_station(start_station)
    puts 'Выберите имя конечной станций'
    stop_station = gets.chomp
    stop = find_station(stop_station)
    routes_list
    puts 'Введите новый номер маршута'
    number_route = gets.to_i
    if start && stop
      @routes << Route.new(start, stop, number_route)
      puts SUCCESS
    else
      puts WRONG_ATTR
    end
  rescue Exeption => error
    puts "Ошибка: #{error.message}"
    retry
  end

  def routes_list
    puts "_________"
    @routes.each { |route| puts route.number }
  end

  def assign_route_train
    trains_list
    puts 'Введите номер поезда:'
    number_train = gets.to_i
    train = find_train(number_train)
    routes_list
    puts 'Введите номер маршрута:'
    number_route = gets.to_i
    route = find_route(number_route)
    if route && train
      train.set_route(route)
      puts SUCCESS
    else
      puts  UNKNOWN_COMAND
    end
  end

  def add_wagon_to_train
    trains_list
    puts "Введите номер поезда"
    number_train = gets.to_i
    train = find_train(number_train)
    wagons_list
    puts "Введите номер вагона:"
    number_wagon = gets.to_i
    wagon = find_wagon(number_wagon)
    if wagon && train
      train.add_wagon(wagon)
    puts SUCCESS
    else
      puts UNKNOWN_COMAND
    end
  end

  def train_wagons_with_numbers(train)
    if @trains.include?(train)
      train.wagons.each { |wagon| puts wagon }
    end
  end

  def remove_wagon_from_train
    trains_list
    puts 'Выберите номер ПОЕЗДА:'
    train_number = gets.to_i
    train = find_train(train_number)
    result = train_wagons_with_numbers(train)
    if result
    puts "Выберите вагона"
    wagon_number = gets.to_i
    wagon = find_wagon(wagon_number)
    train.remove_wagon(wagon)
    puts SUCCESS
    else
      puts UNKNOWN_COMAND
    end
  end

  def move_train
    trains_list
    puts 'Введите номер поезда:'
    number = gets.to_i
    train = find_train(number)
    puts "Выберите куда вы хотите передвинуть поезд - 1.Вперед 2.Назат"
    number = gets.to_i
    if train && number == 1
      train.go_forward
      puts SUCCESS
    elsif train && number == 2
      train.go_back
    else
      puts UNKNOWN_COMAND
    end
  end

  def station_trains
    stations_list
    puts 'Введите имя станции:'
    name_station = gets.chomp
    station = find_station(name_station)
    if station
      trains = station.trains
      trains.each_with_index { |train, index| puts "#{index + 1}. #{train.number}"  }
    else
      puts 'На станций нет поездов'
    end
  end

end
