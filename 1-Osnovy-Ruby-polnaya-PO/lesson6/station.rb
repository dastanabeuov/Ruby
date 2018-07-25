require_relative "instance_counter.rb"
require_relative "exeption.rb"
class Station
  include InstanceCounter
  include Exeption
  @@all_stations = []

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    register_instance
    validate!
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

  protected

  def validate!
    raise "Имя не может быть пустым" if name.nil?
    raise "Слишком короткая информация, имя не может быть меньше чем 5 символов" if name.length < 5
    raise "Станция уже существует, убедитесь что Вы правильно вводите данные" if @@all_stations.include?(name)
  end

end
