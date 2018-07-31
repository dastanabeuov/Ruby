require_relative "company_name.rb"
require_relative "exeption.rb"
require_relative "info.rb"

class Wagon
  include CompanyName
  include Exeption

  attr_reader :number, :total_number, :taken_number
  def initialize(number, type, volum)
    @number = number
    @type = type
    @total_number = volum
    @taken_number = 0
    validate!
  end

  def load(volum)
    raise 'Нет свободных мест' if @taken_number > @total_number
    @taken_number += volum
  end

  def free
    raise 'Свободных мест нет' if @total_number == 0 || @total_number < @taken_number
    @total_number - @taken_number
  end

  protected
  NUMBER_FORMAT = /^([\w]{3}-*[\w]{2})$/
  def validate!
    raise "Номер Вагона не может быть пустым" if number.nil?
    raise "Номер Вагона не сответствует формату" if number !~ NUMBER_FORMAT
  end
end