require_relative "wagon.rb"
class PassengerWagon < Wagon
  def initialize(number)
    super(number, :pass)
  end
end
