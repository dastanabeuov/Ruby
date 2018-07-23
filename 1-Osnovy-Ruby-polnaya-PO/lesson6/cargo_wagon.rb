require_relative "wagon.rb"
class CargoWagon < Wagon
  def initialize(number)
    super(number, :cargo)
  end
end
