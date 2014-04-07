require_relative 'plateau'

class MarsRover

  X_COORDINATE = 0
  Y_COORDINATE = 1

  attr_reader :location, :heading, :plateau

  def initialize(location_and_heading, plateau) # format given: X Y N
    split_input = location_and_heading.match(/([\d]+\s+[\d]+)\s+([NESW])/) # => #<MatchData "1 2 N" 1:"1 2" 2:"N">
    @location = split_input[1].split(" ").map(&:to_i)
    @heading = split_input[2]
    @plateau = plateau
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
    when "N" then @location[Y_COORDINATE] += 1 if @plateau.rover_move_possible?([location[X_COORDINATE], location[Y_COORDINATE]+1])
    when "E" then @location[X_COORDINATE] += 1 if @plateau.rover_move_possible?([location[X_COORDINATE]+1, location[1]])
    when "S" then @location[Y_COORDINATE] -= 1 if @plateau.rover_move_possible?([location[X_COORDINATE], location[Y_COORDINATE]-1])
    when "W" then @location[X_COORDINATE] -= 1 if @plateau.rover_move_possible?([location[X_COORDINATE]-1, location[Y_COORDINATE]])
    end
  end

  def output
    main = "#{@location[X_COORDINATE]} #{@location[Y_COORDINATE]} #{@heading}"
    if dead?
       "#{main} RIP"
    else
      "#{main}"
    end
  end

  def dead?
    true if !@plateau.location_within_range?(@location)
    if true
      final_coordinates
      true
    end
  end

  def final_coordinates
    if @location[X_COORDINATE] > @plateau.upper_right_coordinates[X_COORDINATE]
      @location[X_COORDINATE] = @plateau.upper_right_coordinates[X_COORDINATE]
    elsif @location[X_COORDINATE] < 0
      @location[X_COORDINATE] = 0
    elsif @location[Y_COORDINATE] > @plateau.upper_right_coordinates[Y_COORDINATE]
      @location[Y_COORDINATE] = @plateau.upper_right_coordinates[Y_COORDINATE]
    elsif @location[Y_COORDINATE] < 0
      @location[Y_COORDINATE] = 0
    end
    @plateau.add_beacon(@location)
  end

end
