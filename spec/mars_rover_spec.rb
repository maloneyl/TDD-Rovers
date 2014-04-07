require 'rspec'
require_relative '../lib/mars_rover.rb'

describe MarsRover do
  before(:each) do
    @plateau = Plateau.new("5 5")
    @rover1 = MarsRover.new("1 2 N", @plateau)
    @rover2 = MarsRover.new("3 3 E", @plateau)
  end

  it "should have a location and heading" do
    expect(@rover1.location).to eql([1, 2])
    expect(@rover1.heading).to eql("N")
  end

  it "should spin 90 degrees right if given the expression 'R'" do
    @rover1.spin_and_move("R")
    expect(@rover1.heading).to eql("E")
  end

  it "should spin 90 degrees right if given the expression 'RLR'" do
    @rover1.spin_and_move("RLR")
    expect(@rover1.heading).to eql("E")
  end

  it "should spin 90 degrees left if given the expression 'L'" do
    @rover1.spin_and_move("L")
    expect(@rover1.heading).to eql("W")
  end

  it "should move by 1 coordinate if given the expression 'M'" do
    @rover1.spin_and_move("M")
    expect(@rover1.location).to eql([1, 3])
  end

  it "should reach [1, 3] heading N if given the expression 'LMLMLMLMM' and starting at [1, 2] heading N" do
    @rover1.spin_and_move("LMLMLMLMM")
    expect(@rover1.location).to eql([1, 3])
    expect(@rover1.heading).to eql("N")
  end

  it "should reach [5, 1] heading E if given the expression 'MMRMMRMRRM' and starting at [3, 3] heading E" do
    @rover2.spin_and_move("MMRMMRMRRM")
    expect(@rover2.location).to eql([5, 1])
    expect(@rover2.heading).to eql("E")
  end

  it "should be able to move beyond the plateau's coordinates (i.e. be able to fall off)" do
    @rover1.spin_and_move("MMMM")
    expect(@rover1.location).to eql([1, 6])
  end

  it "should output its final on-plateau location followed by 'RIP' and leave a beacon at that final location if it has been instructed to move too far and fall off the plateau" do
    @rover1.spin_and_move("MMMM")
    expect(@rover1.dead?).to eql(true)
    expect(@rover1.output).to eql("1 5 N RIP")
    expect(@rover1.plateau.beacons).to include([1, 5])
  end

  it "should not be able to move into a location that has a beacon" do
    @rover1.spin_and_move("MMMM")
    expect(@rover1.dead?).to eql(true)
    expect(@rover1.output).to eql("1 5 N RIP")
    expect(@rover1.plateau.beacons).to include([1, 5])
    @rover2.spin_and_move("LMMLMM")
    expect(@rover2.location).not_to eql([1, 5])
    expect(@rover2.location).to eql([2, 5])
  end
end
