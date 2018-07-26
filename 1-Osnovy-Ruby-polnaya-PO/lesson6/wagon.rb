require_relative "company_name.rb"
require_relative "exeption.rb"
require_relative "info.rb"

class Wagon
  include CompanyName
  include Exeption


  attr_reader :number
  def initialize(number, type)
    @number = number
    @type = type
    validate!
  end

  protected
  NUMBER_FORMAT = /^([\w]{3}-*[\w]{2})$/
  def validate!
    raise "Номер Вагона не может быть пустым" if number.nil?
    raise "Номер Вагона не сответствует формату" if number !~ NUMBER_FORMAT
  end
end
