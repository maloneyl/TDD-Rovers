require 'rspec'
require_relative '../lib/mars_rover.rb'

describe MarsRover do
  before(:each) do
    @plateau = Plateau.new("5 5")
    @rover1 = MarsRover.new("1 2 N", @plateau)
    @rover2 = MarsRover.new("3 3 E", @plateau)
  end

  it "should have a location and heading" do
    @rover1.location.should == [1, 2]
    @rover1.heading.should == "N"
  end

  it "should spin 90 degrees right if given the expression 'R'" do
    @rover1.spin_and_move("R")
    @rover1.heading.should == "E"
  end

  it "should spin 90 degrees right if given the expression 'RLR'" do
    @rover1.spin_and_move("RLR")
    @rover1.heading.should == "E"
  end

  it "should spin 90 degrees left if given the expression 'L'" do
    @rover1.spin_and_move("L")
    @rover1.heading.should == "W"
  end

  it "should move by 1 coordinate if given the expression 'M'" do
    @rover1.spin_and_move("M")
    @rover1.location.should == [1, 3]
  end

  it "should reach [1, 3] heading N if given the expression 'LMLMLMLMM' and starting at [1, 2] heading N" do
    @rover1.spin_and_move("LMLMLMLMM")
    @rover1.location.should == [1, 3]
    @rover1.heading.should == "N"
  end

  it "should reach [5, 1] heading E if given the expression 'MMRMMRMRRM' and starting at [3, 3] heading E" do
    @rover2.spin_and_move("MMRMMRMRRM")
    @rover2.location.should == [5, 1]
    @rover2.heading.should == "E"
  end

  # it "should not move if the location to move to is not available" do
  #   @rover1.spin_and_move("MMMM")
  #   @rover1.location.should_not == [1, 6]
  #   @rover1.location.should == [1, 5]
  # end


end
