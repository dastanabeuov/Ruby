require_relative "train.rb"

class PassengerTrain < Train
  attr_accessor :number #getter and setter

  def initialize(number) #
    super(number, 'pass')
  end

  def add_wagon(pass)
    if pass.instance_of?(PassengerWagon)
      super(pass)
    else
      puts 'Можно добавлять только пассажирские вагоны'
    end
  end
end
