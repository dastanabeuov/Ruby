#2. Заполнить массив числами от 10 до 100 с шагом 5
arry = Array.new()
(10..100).step(5).map do |n|
  arry.to_a << n
end
puts arry
