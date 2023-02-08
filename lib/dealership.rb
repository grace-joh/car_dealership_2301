require './lib/car'

class Dealership
  attr_reader :name, :address
  attr_accessor :inventory

  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end

  def inventory_count
    @inventory.length
  end

  def add_car(car)
    @inventory << car
  end

  def has_inventory?
    inventory_count != 0
  end

  def cars_by_make(make)
    @inventory.select{|car| car.make == make}
  end

  def total_value
    total_value = 0
    @inventory.each{ |car| total_value += car.total_cost}
    total_value
  end

  def details
    details = { 
      "total_value" => total_value,
      "address" => @address
    }
  end
    
  def average_price_of_car
    return "0" if inventory_count == 0
    average = (total_value / inventory_count)
    average.to_s.chars.reverse.each_slice(3).map(&:join).join(',').reverse
  end

  def cars_sorted_by_price
    @inventory.sort_by{ |car| car.total_cost }
  end
end