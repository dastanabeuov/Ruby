#workd4
puts "Plz type the any number 3 parmeters"
a = gets.to_f
b = gets.to_f
c = gets.to_f

d = b**2 - 4 * a * c

puts "#{d}"

dsqrt = Math.sqrt(d)

if d < 0 
	puts "This false the end"
elsif d > 0
	x1 = (-b + dsqrt) / (2 * a) 
  x2 = (-b - dsqrt) / (2 * a)
	puts "#{x1} and #{x2}"
else d == 0
	x = - b / 2 * a
	puts "#{x}"
end

