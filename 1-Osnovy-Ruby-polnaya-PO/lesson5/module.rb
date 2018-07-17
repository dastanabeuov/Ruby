module AssignCompanyName
  def assign(*name)
    class_variable_set(:@@company_names, names)
  end

  def company_name
    class_variable_get(:@@company_names)
  end
end

module InstanceCounter
  def included(base)
    base.extend ClassMethod
    base.send :include, InstanceMethod
  end

  module ClassMethod
    def instances
      self.(@@counter)
    end
  end

  module InstanceMethod
    protected
    def register_instance
      @@counter += 1
    end
  end

end
