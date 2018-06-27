require_relative "train.rb"

class PassengerTrain < Train
  def initialize(number)
    super(number, :pass)
  end

  def add_wagon_pass(wagon)
    if wagon.instance_of?(PassengerWagon)
      super
    end
  end
end
