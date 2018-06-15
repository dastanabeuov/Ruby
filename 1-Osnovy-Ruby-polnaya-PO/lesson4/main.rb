require_relative "train.rb"
require_relative "station.rb"
require_relative "rout.rb"
require_relative "passenger_train.rb"
require_relative "passenger_wagon.rb"
require_relative "cargo_train.rb"
require_relative "cargo_wagon.rb"
require_relative "build.rb"

b = Build.new
b.run
b.menu
