require 'rspec'
require 'pry'
require 'pry-byebug'

describe Plateau do
  before(:each) do
    @plateau = Plateau.new("5 5")
  end

  it "should identify a location as taken if there is a rover at that location" do
    @rover1 = MarsRover.new("0 1 E", @plateau)
    @plateau.rovers << @rover1
    expect(@plateau.location_available?([0, 1])).to eql(false)
  end

  it "should identify a location as taken if there is a beacon at that location" do
    @beacon1 = [2, 2]
    @plateau.beacons << @beacon1
    expect(@plateau.location_available?([2, 2])).to eql(false)
  end

  it "should identify a location as out of range if the location given is not within the size indicated by its upper-right coordinates" do
    expect(@plateau.location_within_range?([0, 1])).to eql(true)
    expect(@plateau.location_within_range?([5, 6])).to eql(false)
  end

  it "should identify a location as available if there is no rover or beacon at the location" do
    @rover1 = MarsRover.new("0 1 E", @plateau)
    @plateau.rovers << @rover1
    @rover2 = MarsRover.new("3 3 E", @plateau)
    @plateau.rovers << @rover2
    expect(@plateau.location_available?([0, 2])).to eql(true)
    expect(@plateau.location_available?([3, 3])).to eql(false)
  end
end
