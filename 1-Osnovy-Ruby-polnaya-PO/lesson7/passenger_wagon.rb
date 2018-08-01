require_relative "wagon.rb"
class PassengerWagon < Wagon
  def initialize(number, volume)
    super(number, :pass, volume)
  end

  def load
    super(1)
  end
end
