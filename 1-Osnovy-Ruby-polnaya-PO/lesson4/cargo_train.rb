require_relative "train.rb"

class CargoTrain < Train
  attr_accessor :cargo_train

  def initialize
    super(name, type='cargo')
    @name = name
    @type = type
  end

  def add_wagon(cargo)
    if cargo.instance_of?(CargoWagon)
      super(cargo)
    else
      puts 'Можно добавлять только грузовые вагоны'
    end
  end

end
