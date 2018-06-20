require_relative "train.rb"

class CargoTrain < Train
  attr_accessor :number

  def initialize(number, type='cargo')
    @number = number
    @type = type
  end

  def add_wagon
    puts "Введите цифру (2) для добавления --ВАГОНА-- грузовому поезду"
    choice = gets.to_i
    if choice == 2
      super(CargoWagon)
      puts "Вагон добавлен к поезду"
    else
      puts 'Ошибка типа вагона - к грузовому поезду можно добавить только грузовые ВАГОНЫ'
    end
  end

end

class CargoWagon
  attr_accessor :number, :type

  def initialize(number, type='cargo')
    @number = number
    @type = type
  end
end
