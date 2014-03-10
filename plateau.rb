require "pry"
require "pry-byebug"
require "rspec"
require_relative "mars_rover"

class Plateau
  attr_reader :upper_right_coordinates
  attr_accessor :rovers

  def initialize(upper_right_coordinates) # user input will be a string
    @upper_right_coordinates = upper_right_coordinates.split(" ").map(&:to_i)
    @rovers = []
  end

  def rover_move_possible?(coordinates)
    location_available?(coordinates) && location_within_range?(coordinates)
  end

  def location_available?(coordinates)
    beep = 0
    @rovers.each do |rover|
      beep += 1 if rover.location == coordinates
    end
    beep > 0 ? false : true
  end

  def location_within_range?(coordinates)
    coordinates[1] <= @upper_right_coordinates[1] && coordinates[1] >= 0 &&
    coordinates[0] >= 0 && coordinates[0] <= @upper_right_coordinates[0]
  end

end

describe Plateau do
  before(:each) do
    @plateau = Plateau.new("5 5")
  end

  it "should mark a location as taken if there is a rover at that location" do
    @rover1 = MarsRover.new("0 1 E")
    @plateau.rovers << @rover1
    @plateau.location_available?([0, 1]).should == false
  end

  it "should mark a location as out of range if the location given is not within the size indicated by its upper-right coordinates" do
    @plateau.location_within_range?([0, 1]).should == true
    @plateau.location_within_range?([5, 6]).should == false
  end

  it "should return a location as available if there is no rover at the location and the location is within the size indicated by its upper-right coordinates" do
    @rover1 = MarsRover.new("0 1 E")
    @plateau.rovers << @rover1
    @rover2 = MarsRover.new("3 3 E")
    @plateau.rovers << @rover2
    @plateau.rover_move_possible?([0, 2]).should == true
    @plateau.rover_move_possible?([3, 3]).should == false
    @plateau.rover_move_possible?([6, 6]).should == false
  end
end
