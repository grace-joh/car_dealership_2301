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
end
