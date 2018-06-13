class Station
  attr_reader :name, :trains

  def initialaize(name)
    @name = name
    @trains = []
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
      puts "Нет в базе данных!"
    end
  end
end
