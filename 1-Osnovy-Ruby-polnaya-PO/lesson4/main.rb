#Создать программу в файле main.rb,
#которая будет позволять пользователю через
#текстовый интерфейс делать следующее:
 #- Создавать станции
 #- Создавать поезда
 #- Создавать маршруты и управлять станциями в нем (добавлять, удалять)
 #- Назначать маршрут поезду
 #- Добавлять вагоны к поезду
 #- Отцеплять вагоны от поезда
 #- Перемещать поезд по маршруту вперед и назад
 #- Просматривать список станций и список поездов на станции
require_relative "train.rb"
require_relative "station.rb"
require_relative "rout.rb"
require_relative "passenger_train.rb"
require_relative "cargo_train.rb"
require_relative "interface.rb"
require_relative "info.rb"
require_relative "wagon.rb"
b = Interface.new
b.create
b.run
