#workd4
puts "Plz type the any number 3 parmeters"
a = gets.to_i
b = gets.to_i
c = gets.to_i
d = b**2 - 4 * a * c

puts "#{d}"

if d < 0 
	puts "This false the end"
elsif d > 0
	x1 = (-b + Math.sqrt(d)) / (2 * a) and x2 = (-b - Math.sqrt(d)) / (2 * a)
	puts "#{x1} and #{x2}"
else d == 0
	x = - b / 2 * a
	puts "#{x}"
end

