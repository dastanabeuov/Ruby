require_relative "wagon.rb"
class PassengerWagon < Wagon
  def initialize(number, volum)
    super(number, :pass, volum)
  end

  def load
    super(1)
  end
end
