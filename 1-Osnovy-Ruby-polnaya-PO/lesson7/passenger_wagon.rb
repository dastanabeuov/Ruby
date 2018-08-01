require_relative "wagon.rb"
class PassengerWagon < Wagon
  def initialize(number, volume)
    super(number, :pass, volume)
  end

  def take_volume
    super(1)
  end
end
