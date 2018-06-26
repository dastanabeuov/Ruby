require_relative "train.rb"

class CargoTrain < Train
  def initialize(number)
    super(number, :cargo)
  end

  def add_wagon(wagon)
    if wagon.instance_of?(CargoWagon)
      super
    else
      false
    end
  end
end
