class TrainYard
  attr_reader :location,
              :trains

  def initialize(info)
    @location = info[:location]
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def types_of_trains
    train_types = @trains.map do |train|
      train.type
    end
    train_types.sort_by do |type|
      type
    end.uniq
  end
end
