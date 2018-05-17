puts "Programma idealny ves"
print "whats you name?"
first_name = gets.chomp
print "wats your weight?"
user_weight = gets.to_i
print "whats you growth"
growth = gets.to_i
result = growth - 110
if result == user_weight
	print "Vash ves uje optimalny"
else
	print "#{first_name} vas idealny ves dolzen byt #{result} hudei dalshe...)"
end
