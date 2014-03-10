require "rspec"
require_relative "plateau"

class MarsRover
  attr_reader :location, :heading

  def initialize(location_and_heading) # format given: X Y N
    split_input = location_and_heading.match(/([\d]+\s+[\d]+)\s+([NESW])/) # => #<MatchData "1 2 N" 1:"1 2" 2:"N">
    @location = split_input[1].split(" ").map(&:to_i)
    @heading = split_input[2]
  end

  def spin_and_move(instructions) # format given: LRRMLM
    instructions.split("").each do |instruction|
      case instruction
      when "R" then turn_by_degrees(90)
      when "L" then turn_by_degrees(-90)
      when "M" then move
      end
    end
  end

  def turn_by_degrees(degrees_to_turn)
    convert_cardinal_points_to_degrees(@heading, degrees_to_turn)
    turned_position_in_degrees = @existing_heading_in_degrees + degrees_to_turn
    convert_degrees_to_cardinal_points(turned_position_in_degrees)
  end

  def convert_cardinal_points_to_degrees(cardinal_point, degrees_to_turn)
    case cardinal_point
    when "N" then @existing_heading_in_degrees = degrees_to_turn > 0 ? 0 : 360
    when "E" then @existing_heading_in_degrees = 90
    when "S" then @existing_heading_in_degrees = 180
    when "W" then @existing_heading_in_degrees = 270
    end
  end

  def convert_degrees_to_cardinal_points(degrees)
    case degrees
    when 0 then @heading = "N"
    when 90 then @heading = "E"
    when 180 then @heading = "S"
    when 270 then @heading = "W"
    when 360 then @heading = "N"
    end
  end

  def move
    case @heading
    when "N" then @location[1] += 1
    when "E" then @location[0] += 1
    when "S" then @location[1] -= 1
    when "W" then @location[0] -= 1
    end
  end

  # def move
  #   case @heading
  #   when "N" then @location[1] += 1 if location_available?
  #   when "E" then @location[0] += 1 if location_available?
  #   when "S" then @location[1] -= 1 if location_available?
  #   when "W" then @location[0] -= 1 if location_available?
  #   end
  # end

end

describe MarsRover do
  before(:each) do
    @rover1 = MarsRover.new("1 2 N")
    @rover2 = MarsRover.new("3 3 E")
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


  # it "should not move if the position to move to is already taken" do
  #   @rover1.move
  #   @rover1.location.should_not == [0, 1]
  # end

end
