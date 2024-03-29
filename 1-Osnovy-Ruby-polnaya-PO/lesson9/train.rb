# frozen_string_literal: true

require_relative 'company_name.rb'
require_relative 'instance_counter.rb'
require_relative 'exeption.rb'
require_relative 'validate'
require_relative 'accessor'

class Train
  include CompanyName
  include InstanceCounter
  include Exeption
  include Validation
  extend Accessors

  attr_reader :number, :type, :wagons
  attr_accessor_with_history :speed
  @@trains = {}
  NUMBER_FORMAT = /^([\w]{3}-*[\w]{2})$/
  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
    validate!
    register_instance
    @@trains[number] = self
  end

  def each_wagon
    @wagons.each { |wagon| yield(wagon) }
  end

  def self.find(number)
    @trains[number]
  end

  def add_wagon(wagon)
    return unless @type == wagon.type
    @wagons << wagon if speed.zero?
  end

  def remove_wagon(wagon)
    @wagons.delete(wagon) if wagons.include?(wagon) && speed.zero?
  end

  def set_route(route)
    @route = route
    route.start_station.handle_train_arrival(self)
    @current_index = 0
  end

  def next_station
    if @route
      @route.stations[@current_index + 1]
    else
      puts 'Значение в маршруте не существует, сперва нужно задать маршут поезду'
    end
  end

  def current_station
    @route.stations[@current_index]
  end

  def prev_station
    if current_station != @route.start_station
      @route.stations[@current_index - 1]
    else
      puts 'Это первая станция'
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
      puts 'Не возможно движение назат, так как это первая станция'
    end
  end

  def speed_up
    @speed += 1
  end

  def slow_down
    @speed -= 1 if speed != 0
  end

  protected

  def validate!
    raise 'Аргумент *номер* не должен быть пустым' if number.nil?
    raise 'Неправильный формат номера' if number !~ NUMBER_FORMAT
  end
end
