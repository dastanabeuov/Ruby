require_relative "train.rb"

class PassengerTrain < Train
  attr_accessor :number

  def initialize(number, type='pass')
    @number = number
    @type = type
  end

  def add_wagon
    puts "Введите цифру (1) для добавления --ВАГОНА-- пассажирскому поезду"
    choice = gets.to_i
    if choice == 1
      super(PassengerWagon)
      puts "Вагон добавлен к поезду"
    else
      puts 'Ошибка типа вагона - к пассажирскому поезду можно добавить только пассажирские ВАГОНЫ'
    end
  end

end

class PassengerWagon
  attr_accessor :number, :type

  def initialize(number, type='pass')
    @number = number
    @type =type
  end
end
