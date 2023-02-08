require 'rspec'
require './lib/dealership'

Rspec.describe Dealership do
  describe '#initialize' do
    before(:each) do
      @dealership = Dealership.new("Acme Auto", "123 Main Street")
    end
  
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
end
