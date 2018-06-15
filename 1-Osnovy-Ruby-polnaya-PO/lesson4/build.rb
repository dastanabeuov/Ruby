class Main
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagon = []
  end

  def run
    menu
  end

  private

  def menu
    puts %q(
    0. Создать станцию
    1. Создать поезд
    2. Создать маршрут
    3. Назначить маршрут поезду
    4. Добавить вагон к поезду
    5. Отцепить вагон от поезда
    6. Переместить поезд по маршруту вперед
    7. Переместить поезд по маршрутуи назад
    8. Просмотреть список станций
    9. Просмотреть список поездов на станции
    Введите exit чтобы выйти
    )

    loop do
      puts 'Введите команду: '
      choice = gets.to_i
      case choice
      when 0
        create_station
      when 1
        create_train
      when 2
        create_route
      when 3
        assign_route
      when 4
        add_wagon_to_train
      when 5
        remove_wagon_from_train
      when 6
        move_train_forward
      when 7
        move_train_back
      when 8
        stations_list
      when 9
        station_trains
      end
    end
  end

  def select_type
    puts %( Выберите тип:
      1. Пассажирский
      2. Грузовой
    )
    @choice = gets.to_i
  end

  def find_station(name)
    @stations.detect { |station| station.name == name }
  end

  def find_train(number)
    @trains.detect { |train| train.number == number }
  end

  def find_route(number)
    @route.detect { |route| route.number == number }
  end

  def find_wagon(number)
    @wagons.detect { |wagon| wagons.number == number }
  end

  def create_station
    puts 'Введите название станции: '
    name = gets.chomp
    station = Station.new(name)
    @stations << station
  end

  def create_train
    puts 'Введите номер поезда: '
    number = gets.to_i

    select_type
    if @choice == 1
      train = PassangerTrain.new(number)
    elsif @choice == 2
      train = CargoTrain.new(number)
    end

    @trains << train
  end

  def create_route
    puts 'Введите номер маршрута: '
    number = gets.to_i

    puts 'Введите имя первой станции: '
    name = gets.chomp
    start_station = find_station(name)

    puts 'Введите имя последней станции: '
    name = gets.chomp
    stop_station = find_station(name)

    route = Route.new(number, start_station, stop_station)
    @routes << route
  end

  def assign_route
    puts 'Введите номер поезда: '
    number = gets.to_i
    train = find_train(number)

    puts 'Введите номер маршрута: '
    number = gets.to_i
    route = find_route(number)

    if !route.nil? && !train.nil?
      train.set_route(route)
    else
      puts 'Невозможно назначить маршрут поезду'
    end
  end

  def add_wagon_to_train
    puts 'Введите номер вагона: '
    number = gets.to_i

    select_type
    if @choice == 1
      carriage = PassangerCarriage.new(number)
    elsif @choice == 2
      carriage = CargoCarriage.new(number)
    else
      puts 'Выберите тип вагона'
    end
    @wagons << wagon

    puts 'Введите номер поезда: '
    number = gets.to_i
    train = find_train(number)

    if !train.nil? && !wagon.nil?
      train.add_wagon(wagon)
    else
      puts 'Невозможно добавить вагон'
    end
  end

  def remove_wagon_from_train
    puts 'Введите номер вагона: '
    number = gets.to_i
    wagon = find_wagon(number)

    puts 'Введите номер поезда: '
    number = gets.to_i
    train = find_train(number)

    if !train.nil? && !wagon.nil?
      train.remove_wagon(wagon)
    else
      puts 'Невозможно oтцепить вагон'
    end
  end

  def move_train_forward
    puts 'Введите номер поезда: '
    number = gets.to_i
    train = find_train(number)

    if !train.nil?
      train.go_forward
    else
      puts 'Невозможно переместить поезд по маршруту вперед'
    end
  end

  def move_train_back
    puts 'Введите номер поезда: '
    number = gets.to_i
    train = find_train(number)

    if !train.nil?
      train.go_back
    else
      puts 'Невозможно переместить поезд по маршруту назад'
    end
  end

  def stations_list
    @stations.each { |station| puts station.name }
  end

  def station_trains
    puts 'Введите имя станции: '
    name = gets.chomp
    station = find_station(name)

    if !station.nil?
      puts stations.trains
    else
      puts 'Такой станции нет'
    end
  end
end
