require 'rspec'
require './lib/car'

RSpec.describe Car do
  before(:each) do
    @car = Car.new("Ford Mustang", 1500, 36)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@car).to be_a Car
    end

    it 'has a monthly payment' do
      expect(@car.monthly_payment).to eq(1500)
    end

    it 'has a loan length' do
      expect(@car.loan_length).to eq(36)
    end

    it 'has a default color nil' do
      expect(@car.color).to eq(nil)
    end
  end

  describe '#make' do
    it 'has a make' do
      expect(@car.make).to eq("Ford")
    end
  end

  describe '#model' do
    it 'has a model' do
      expect(@car.model).to eq("Mustang")
    end
  end

  describe '#total_cost' do
    it 'has a total cost' do
      expect(@car.total_cost).to eq(54000)
    end
  end

  describe '#paint!' do
    it 'paints car given color' do
      @car.paint!(:blue)
      
      expect(@car.color).to eq(:blue)
    end
  end
end
