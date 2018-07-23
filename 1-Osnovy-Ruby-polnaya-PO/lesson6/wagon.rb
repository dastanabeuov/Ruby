require_relative "company_name.rb"
class Wagon
  include CompanyName

  attr_reader :number
  def initialize(number, type)
    @number = number
    @type = type
  end
end
