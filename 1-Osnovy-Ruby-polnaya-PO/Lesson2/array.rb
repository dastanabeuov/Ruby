#2. Заполнить массив числами от 10 до 100 с шагом 5
arry = []
(10..100).step(5).each { |n| arry.to_a << n } 
puts arry
