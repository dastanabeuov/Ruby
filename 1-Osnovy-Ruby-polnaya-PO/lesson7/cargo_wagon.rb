require_relative "wagon.rb"
class CargoWagon < Wagon
  def initialize(number, general)
    super(number, :cargo, general)
  end
end
