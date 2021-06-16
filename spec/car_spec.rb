require 'rspec'
require './lib/car'
require './lib/train'

RSpec.describe Car do
  before :each do
    @car1 = Car.new({type: 'Mail', weight: 5})
    @car2 = Car.new({type: 'Passengers', weight: 1})
  end
  describe 'instantiation' do
    it 'exists' do
      expect(@car1).to be_a(Car)
    end

    it 'has readable attributes' do
      expect(@car1.type).to eq('Mail')
      expect(@car1.weight).to eq(5)
    end
  end
end
