require 'rspec'
require './lib/car'
require './lib/train'

RSpec.describe Train do
  before :each do
    @car1 = Car.new({type: 'Mail', weight: 5})
    @car2 = Car.new({type: 'Passengers', weight: 1})
    @train1 = Train.new({name: 'Thomas', type: 'Tank'})
  end
  describe 'instantiation' do
    it 'exists' do
      expect(@train1).to be_a(Train)
    end

    it 'has readable attributes' do
      expect(@train1.name).to eq('Thomas')
      expect(@train1.type).to eq('Tank')
      expect(@train1.cargo).to eq({})
    end
  end

  describe 'methods' do
    it 'can add cars to a train and count cars' do
      expect(@train1.count_cars(@car1)).to eq(0)

      @train1.add_cars(@car1, 2)

      expect(@train1.cargo).to eq({@car1 => 2})
      expect(@train1.count_cars(@car1)).to eq(2)

      @train1.add_cars(@car1, 3)

      expect(@train1.cargo).to eq({@car1 => 5})
      expect(@train1.count_cars(@car1)).to eq(5)

      @train1.add_cars(@car2, 10)
      expect(@train1.cargo).to eq({@car1 => 5, @car2 => 10})
    end

    it 'can calculate weight (sum of all thier cars weight)' do
      @train1.add_cars(@car1, 2)
      @train1.add_cars(@car1, 3)
      @train1.add_cars(@car2, 10)

      expect(@train1.weight).to eq(35)
    end

  end
end
