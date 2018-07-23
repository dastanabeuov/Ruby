module Exeption
  def valid?
    validate!
    true
  rescue
    false
  end

  protected
  def init_validate
    validate!
  rescue Exception => error
    puts "ОШИБКА: #{error.message}"
    raise error
  end
end

