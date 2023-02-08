require 'rspec'
require './lib/dealership'

RSpec.describe Dealership do
  before(:each) do
    @dealership = Dealership.new("Acme Auto", "123 Main Street")
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(@dealership).to be_a Dealership
    end

    it 'has a name' do
      expect(@dealership.name).to eq("Acme Auto")
    end

    it 'has an address' do
      expect(@dealership.address).to eq("123 Main Street")
    end

    it 'has default inventory of empty array' do
      expect(@dealership.inventory).to eq([])
    end
  end

  describe '#inventory_count' do
    it 'has an inventory count default of 0' do
      expect(@dealership.inventory_count).to eq(0)
    end
  end

  describe '#add_car' do
    it 'adds a car to the inventory array and increases count' do
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      @dealership.add_car(car_1)
      @dealership.add_car(car_2)

      expect(@dealership.inventory).to eq([car_1, car_2])
      expect(@dealership.inventory_count).to eq(2)
    end
  end

  describe '#has_inventory?' do
    it 'has default false' do
      expect(@dealership.has_inventory?).to eq(false)
    end

    it 'returns true if cars are added' do
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      @dealership.add_car(car_1)
      @dealership.add_car(car_2)
      @dealership.add_car(car_3)
      @dealership.add_car(car_4)

      expect(@dealership.has_inventory?).to eq(true)
    end
  end

  describe "#cars_by_make" do
    it 'returns cars of specifice make' do
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      @dealership.add_car(car_1)
      @dealership.add_car(car_2)
      @dealership.add_car(car_3)
      @dealership.add_car(car_4)

      expect(@dealership.cars_by_make("Toyota")).to eq([car_2, car_3])
      expect(@dealership.cars_by_make("Ford")).to eq([car_1])
    end

    it 'returns an empty array if no cars in inventory' do
      expect(@dealership.cars_by_make("Toyota")).to eq([])
    end
  end

  describe "#total_value" do
    it 'returns total value of all cars in dealership' do
      expect(@dealership.total_value).to eq(0)

      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      @dealership.add_car(car_1)
      @dealership.add_car(car_2)
      @dealership.add_car(car_3)
      @dealership.add_car(car_4)

      expect(@dealership.total_value).to eq(156000)
    end
  end

  describe '#details' do
    it 'returns a hash with total value and address' do
      expect(@dealership.details).to be_a Hash
      expect(@dealership.details).to eq({"total_value" => 0, "address" => "123 Main Street"})

      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      @dealership.add_car(car_1)
      @dealership.add_car(car_2)
      @dealership.add_car(car_3)
      @dealership.add_car(car_4)

      expect(@dealership.details).to eq({"total_value" => 156000, "address" => "123 Main Street"})
    end
  end

  describe '#average_price_of_car' do
    it 'returns the average total price of cars as a string' do
      expect(@dealership.average_price_of_car).to eq("0")

      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      @dealership.add_car(car_1)
      @dealership.add_car(car_2)
      @dealership.add_car(car_3)
      @dealership.add_car(car_4)

      expect(@dealership.average_price_of_car).to eq("39,000")
    end
  end
end
