class Missing
  def method_missing(name, *args)
    puts "Called mathod #{name} with arguments #{args}"
    self.class.send(:define_method, name.to_sym, lambda { |*args| args.inspect })
  end
end
