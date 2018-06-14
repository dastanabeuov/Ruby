require_relative "passenger_wagon.rb"

class PassengerTrain < Train

  def add_pass_wagon_for_passtrain
    @pass_train = @pass_wagon
    @number = @number
  end

end
