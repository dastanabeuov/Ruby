puts "Enter the name method"
method = gets.chomp
puts "Enter the string"
str = gets.chomp.to_sym
puts str.send(method)
