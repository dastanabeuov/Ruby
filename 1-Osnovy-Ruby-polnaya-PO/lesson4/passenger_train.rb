require_relative "train.rb"

class PassengerTrain < Train
  def initialize(number)
    super(number, :pass)
  end

  def add_wagon(wagon)
    if wagon.instance_of?(PassengerWagon)
      super
    else
      false
    end
  end
end
