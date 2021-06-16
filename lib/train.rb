class Train
  attr_reader :name,
              :type,
              :cargo

  def initialize(info)
    @name = info[:name]
    @type = info[:type]
    @cargo = Hash.new(0)
  end

  def count_cars(car)
    if @cargo[car] != nil
      @cargo[car]
    else
      0
    end
  end

  def add_cars(car, amount)
    @cargo[car] += amount
  end

  def weight
    @cargo.sum do |car, number|
      car.weight * number
    end
  end
end
