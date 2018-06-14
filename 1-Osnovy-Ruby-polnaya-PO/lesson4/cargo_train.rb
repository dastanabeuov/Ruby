require_relative "cargo_wagon.rb"

class CargoTrain < Train

  def add_car_wagon_for_cargotrain
    @car_train = @car_wagon
    @number = @number
  end

end
