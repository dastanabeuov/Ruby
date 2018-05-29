#3. Заполнить массив числами фибоначчи до 100
fib = [0, 1]

loop do
  fib_sum = fib.last + fib[-2]
  break if fib_sum > 100
  fib << fib_sum
end
puts fib
