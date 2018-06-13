class CargoTrain < Train
  def initialize(number)
    super(number, cargo)
  end

  def add_wagon(wagon)
    while any_type(wagon)
      if @speed == 0
        @wagons << wagon
        wagon.handle_train_arrival(self)
      end
    end
  end

  private

  def any_type(wagon)
    wagon.type == cargo
  end
end
