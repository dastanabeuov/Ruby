#6. Сумма покупок. Пользователь вводит поочередно название товара, 
#цену за единицу и кол-во купленного товара (может быть нецелым числом). 
#Пользователь может ввести произвольное кол-во товаров до тех пор, 
#пока не введет "стоп" в качестве названия товара. На основе введенных данных требуетеся:
#Заполнить и вывести на экран хеш, ключами которого являются названия товаров, 
#а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара. 
#Также вывести итоговую сумму за каждый товар. Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
product = {}

while name_product == "stop" do
  puts "Вводите название товара"
  name_product = gets.chomp 
  puts "Вводите цену за единицу товара"
  price_product = gets.to_f
  puts "Вводите количество купленного товара"
  count_product = gets.to_i
  product[name_product] = { price: price_product, count: count_product }
end

puts product

all_products_price = 0

product.each do |name, price| 
  one_product_price = price[:price] * price[:count]
  all_products_price += one_product_price
  puts "Итоговая сумма каждого товара #{name} ------ #{one_product_price}"
end

puts "Сумма всех покупок в корзине #{all_products_price}"
