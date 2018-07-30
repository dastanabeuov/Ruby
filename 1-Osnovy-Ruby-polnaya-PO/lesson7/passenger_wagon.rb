require_relative "wagon.rb"
class PassengerWagon < Wagon
  def initialize(number, general)
    super(number, :pass, general)
  end

  def take_number
    super(1)
  end
end
