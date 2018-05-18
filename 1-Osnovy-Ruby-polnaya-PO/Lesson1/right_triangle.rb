#work3
puts "Pryamougolny treugolnik"
puts "napishite dlinu vseh 3 storon"

a = gets.to_f
b = gets.to_f
c = gets.to_f

if a**2 + b**2 == c**2
	puts "this is parametrs true-rectangular"
else
  puts "It's not true-rectangular"
end

puts "Second..."

if a**2 + b**2 == c**2 
  a == b || b == c || a == c 
	puts "this is parameters  isoseles"
else a == b && b == c
	puts "this is an isosceles and equilateral triangle"
end



