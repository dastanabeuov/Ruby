require_relative "train.rb"

class CargoTrain < Train
  attr_accessor :number

  def initialize(number)
    super(number, 'cargo')
  end

  def add_wagon(wagon)
    if wagon.instance_of?(CargoWagon)
      super(wagon)
    else
      puts 'Ошибка типа вагона - к грузовому поезду можно добавить только грузовые ВАГОНЫ'
    end
  end

end
