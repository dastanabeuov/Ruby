#текстовый интерфейс делать следующее:
     #- Создавать станции
     #- Создавать поезда
     #- Создавать маршруты и управлять станциями в нем (добавлять, удалять)
     #- Назначать маршрут поезду
     #- Добавлять вагоны к поезду
     #- Отцеплять вагоны от поезда
     #- Перемещать поезд по маршруту вперед и назад
     #- Просматривать список станций и список поездов на станции

class Build
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def run
    menu
  end

  private

  def menu

  loop do
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
       Введите 10 чтобы выйти)

     puts 'Введите команду:'
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
     when 10
       exit
     end
    end
  end

  def select_type
    puts "Выберите тип:  1.Пассажирский  2.Грузовой!"
    @choice = gets.to_i
  end

  def find_station(name)
    @stations.select { |station| station.name == name }
  end

  def find_train(number)
    @trains.select { |train| train.number == number }
  end

  def find_route(number)
    @routes.select { |route| route.number == number }
  end

  def find_wagon(number)
    @wagons.select { |wagon| wagons.number == number }
  end

  def create_station
    puts 'Введите название станции:'
    name = gets.chomp
    @stations << name
    puts 'Станция создано'
  end

  def create_train
    puts 'Введите номер поезда:'
    number = gets.to_i
    select_type
    if @choice == 1
      train = PassengerTrain.new(number)
    elsif @choice == 2
      train = CargoTrain.new(number)
    end
    @trains << train
    puts "Поезд успешно создан"
  end

  def create_route
    puts 'Введите номер поезда'
    name_train = gets.chomp
    route = find_train(name_train)
    @routes << route
    puts "Новый маршрут успешно создан"
  end

  def assign_route
    puts 'Введите номер поезда:'
    number_train = gets.to_i
    train = find_train(number_train)
    puts 'Введите номер маршрута:'
    number_route = gets.to_i
    route = find_route(number_route)
    if route && train
      @stations << route
      @trains << train
      puts "Машут успешно задан текущему поезду"
    else
      puts 'Невозможно назначить маршрут поезду'
    end
  end

  def add_wagon_to_train
    puts "Введите номер вагона:"
    number = gets.to_i
    select_type
    if @choice == 1
      pass_wagon = PassengerTrain.new(number)
      puts "Пассажирский ВАГОН добавлен к Пассажирскому поезду"
    elsif @choice == 2
      cargo_wagon = CargoTrain.new(number)
      puts "Грузовой ВАГОН добавлен к Грузовому поезду"
    else
      puts "Вы не выбрали тип ВАГОНА"
    end
  end

  def remove_wagon_from_train
    puts 'Введите номер вагона:'
    number_wagon = gets.to_i
    wagon = find_wagon(number_wagon)
    puts 'Введите номер поезда: '
    number_train = gets.to_i
    train = find_train(number_train)
    if train && wagon
      train.delete(wagon)
      puts "Вагон успешно отцеплен"
    else
      puts 'Невозможно oтцепить вагон, так как в базе нет таких данных или ошибка ввода параметров'
    end
  end

  def move_train_forward
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
    @stations.each { |station| puts station.name }
  end

  def station_trains
    puts 'Введите имя станции: '
    name = gets.chomp
    station = find_station(name)
    if station
      puts station.trains
    else
      puts 'Такой станции нет'
    end
  end

  def exit
    exit
  end
end
