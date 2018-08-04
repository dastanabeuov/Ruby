# frozen_string_literal: true

require_relative 'train.rb'

class PassengerTrain < Train
  def initialize(number)
    super(number, :pass)
  end

  def add_wagon(wagon)
    super if wagon.instance_of?(PassengerWagon)
  end
end
