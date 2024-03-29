# frozen_string_literal: true

require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'wagon.rb'

require_relative 'passenger_train.rb'
require_relative 'passenger_wagon.rb'
require_relative 'cargo_train.rb'
require_relative 'cargo_wagon.rb'

require_relative 'company_name.rb'
require_relative 'exeption.rb'
require_relative 'info.rb'
require_relative 'instance_counter.rb'
require_relative 'interface.rb'

b = Interface.new
b.create
b.run
