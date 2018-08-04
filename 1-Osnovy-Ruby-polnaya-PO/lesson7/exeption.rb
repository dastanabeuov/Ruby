# frozen_string_literal: true

module Exeption
  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
