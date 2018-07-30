module Exeption
  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end

