require_relative "instance_counter.rb"

class Station
  include InstanceCounter
  @@all_stations = []

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    register_instance
  end

  def self.all
    @@all_stations
  end

  def handle_train_arrival(train)
    @trains << train
  end

  def get_trains_by_type(type)
    @trains.select { |train| train.type == type }
  end

  def send_train(train)
    if trains.include?(train)
      @trains.delete(train)
    else
      puts "Мы не можем удалить из базы, так как нет в базе такой информаций!"
    end
  end
end
