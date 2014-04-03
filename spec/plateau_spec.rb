require 'rspec'
require 'pry'
require 'pry-byebug'

describe Plateau do
  before(:each) do
    @plateau = Plateau.new("5 5")
  end

  it "should mark a location as taken if there is a rover at that location" do
    @rover1 = MarsRover.new("0 1 E", @plateau)
    @plateau.rovers << @rover1
    @plateau.location_available?([0, 1]).should == false
  end

  it "should mark a location as out of range if the location given is not within the size indicated by its upper-right coordinates" do
    @plateau.location_within_range?([0, 1]).should == true
    @plateau.location_within_range?([5, 6]).should == false
  end

  it "should mark a location as available if there is no rover at the location and the location is within the size indicated by its upper-right coordinates" do
    @rover1 = MarsRover.new("0 1 E", @plateau)
    @plateau.rovers << @rover1
    @rover2 = MarsRover.new("3 3 E", @plateau)
    @plateau.rovers << @rover2
    @plateau.rover_move_possible?([0, 2]).should == true
    @plateau.rover_move_possible?([3, 3]).should == false
    # @plateau.rover_move_possible?([6, 6]).should == false
  end
end
