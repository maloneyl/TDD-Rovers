require "rspec"
require_relative "mars_rover"

class Plateau
  attr_reader :upper_right_coordinates, :occupied_locations, :rover1, :rover2

  def initialize(upper_right_coordinates) # user input will be a string
    @upper_right_coordinates = upper_right_coordinates.split(" ").map(&:to_i)
    @occupied_locations = [] # plateau comes before the two rovers
    @rover1 = {}
    @rover2 = {}
  end

  # location is available if:
  # (1) the other rover is not on it, and
  # (2) it is still within the plateau's range
  def location_available()

  end

  def location_taken(coordinates)

  end

end

describe Plateau do
  before(:each) do
    @plateau = Plateau.new("5 5")
  end

  # it "should mark a location as taken if there is a rover at that location" do
  #   @rover1 = MarsRover.new("0 1 E")
  #   @plateau.location_taken([0, 1]).should == true
  # end
end
