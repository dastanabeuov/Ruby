module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :controls

    def validate(name, type, *args)
      @controls ||= []
      @controls << { name: name, type: type, args: args }
    end
  end

  module InstanceMethods
    def validate!
      self.class.controls.each do |control|
        type_control = control[:type]
        name_control = instance_variable_get("@#{controls[:name]}".to_sym)
        args_control = control[:args]
        send(type_control, name_control, args_control)
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    private

    def presence(value, options)
      raise 'Значение не может быть пустым' if value.nil? || value.empty?
    end

    def format(value, options)
      raise 'Неверный формат' if value !~ options
    end

    def type(value, options)
      raise 'Неверный класс' if value.class == options
    end
  end
end
