#work1
puts "Programm ideal weight"

print "whats you name?"
first_name = gets.chomp

print "whats your growth?"
user_growth = gets.to_i

result = growth - 110
puts "Ideal weight #{first_name}: #{result}."

puts "Tell me plz" 
puts "Type your are weight?"
user_weight = gets.to_i

if result != user_weight
	print "Vash ves optimalny"
end

