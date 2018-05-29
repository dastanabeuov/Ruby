#1. Сделать хеш, содеращий месяцы и количество дней в месяце. 
#В цикле выводить те месяцы, у которых количество дней ровно 30

months = { januar: 31, februar: 28, mart: 31,
           aprel: 30, may: 31, jun: 30,
           jul: 31, august: 31, september: 30,
           october: 31, november: 30, december: 31 }

result = months.select { |month, number| number == 30 } 
puts result
