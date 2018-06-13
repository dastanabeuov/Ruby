class Interface
  def wow(wow)
    wow.each_with_index { |element, index| puts "#{index + 1} #{element}" }
    puts "Нажмите '0' для выхода -->[] или выберите один из пунктов"
  end
end
