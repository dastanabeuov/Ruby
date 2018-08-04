# frozen_string_literal: true

require_relative 'train.rb'
class CargoTrain < Train
  def initialize(number)
    super(number, :cargo)
  end

  def add_wagon(wagon)
    super if wagon.instance_of?(CargoWagon)
  end
end
