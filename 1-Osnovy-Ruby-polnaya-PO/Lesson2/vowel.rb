#4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

vowel_index = {}
vowel = ['a', 'e', 'i', 'o', 'u']
('a'..'z').each_with_index do |a,i|
  vowel_index[a] = i + 1 if vowel.include?(a)
end
puts vowel_index
