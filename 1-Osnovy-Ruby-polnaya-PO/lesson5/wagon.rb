class Wagon
  include AssignCompanyName
  attr_reader :number
  @@counter = 0
  def initialize(number, type)
    @number = number
    @type = type
  end
end
