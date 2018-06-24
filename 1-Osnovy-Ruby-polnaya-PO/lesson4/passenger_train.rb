require_relative "train.rb"

class PassengerTrain < Train
  attr_accessor :number

  def initialize(number)
    super(number, 'pass')
  end

  def add_wagon(wagon)
    if wagon.instance_of?(PassengerWagon)
      super(wagon)
    else
      puts 'Ошибка типа вагона - к пассажирскому поезду можно добавить только пассажирские ВАГОНЫ'
    end
  end

end
