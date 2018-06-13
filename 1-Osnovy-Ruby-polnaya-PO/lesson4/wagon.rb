class Wagon
  attr_reader :type, :number
  attr_accessor :train

  def initialize(number,type)
    @number = number
    @type = type
  end

  def handle_train_arrival(train)
    @train = train
  end
end
