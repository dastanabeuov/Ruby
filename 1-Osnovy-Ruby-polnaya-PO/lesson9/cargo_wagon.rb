# frozen_string_literal: true

require_relative 'wagon.rb'
class CargoWagon < Wagon
  def initialize(number, volume)
    super(number, :cargo, volume)
  end
end
