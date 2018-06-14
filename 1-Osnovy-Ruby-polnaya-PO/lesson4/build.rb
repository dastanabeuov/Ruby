require_relative 'interface.rb'
require_relative 'constanta.rb'
require_relative 'train.rb'

class Build < Route

  def run
    self.wow(CONSTANTA)
  end

  def menu
    loop do
      puts 'Введите команду: '
      choice = gets.to_i
      case choice
      when 1
        creat_station
      when 2
        creat_train
      when 3
        add_station #creat_rout
      when 4
        set_rout
      when 5
        add_wagon
      when 6
        remove_wagon
      when 7
        go_forward
      when 8
        go_back
      when 9
        print_stations
      when 10
        print_station
      when 0
        exit
      end
    end
  end

  protected

  def create_station
    creat+statopn = Route.new(start_station, stop_station)
  end

  def creat_train
    Station.new(name)
  end

  def add_station #create_rout
    super
  end

  def set_rout
    super
  end

  def add_wagon
    super
  end

  def remove_wagon
    super
  end

  def go_forward
    super
  end

  def go_back
    super
  end

  def print_stations
    @stations.each { |station| puts station }
  end

  def print_station
    super
  end

  def exit
    break
  end

end
