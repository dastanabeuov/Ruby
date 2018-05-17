#work3
puts "Pryamougolny treugolnik"
puts "napishite dlinu vseh 3 storon"
a = gets.to_i
b = gets.to_i
c = gets.to_i

if a + b == c
	puts "this is parametrs true rectangular"
else
	puts "this false"
end

puts "Second version program"

if a == b || b == c || a == c 
	puts "this is parameters  isoseles"
elsif a == b && b == c
	puts "this is parameters isoseles and equilateral"
end



