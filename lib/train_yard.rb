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

  def trains_containing(car)
    @trains.find_all do |train|
      train.cargo.include?(car)
    end
  end

  def sorted_cargo_list
    cargo_by_type = @trains.map do |train|
      train.cargo.map do |car, amount|
        car.type
      end
    end.flatten.uniq
    cargo_by_type.sort_by do |type|
      type
    end
  end

  def total_inventory
    inventory_hash = Hash.new { |hash, key| hash[key] = 0 }
    @trains.each do |train|
      train.cargo.each do |car, quantity|
        inventory_hash[car] += quantity
      end
    end
    inventory_hash
  end
end
