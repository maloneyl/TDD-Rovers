require_relative 'mars_rover'

class Plateau

  X_COORDINATE = 0
  Y_COORDINATE = 1

  attr_reader :upper_right_coordinates
  attr_accessor :rovers

  def initialize(upper_right_coordinates) # user input will be a string
    @upper_right_coordinates = upper_right_coordinates.split(" ").map(&:to_i)
    @rovers = []
  end

  def rover_move_possible?(coordinates)
    location_available?(coordinates)
    # && location_within_range?(coordinates)
  end

  def location_available?(coordinates)
    beep = 0
    @rovers.each do |rover|
      beep += 1 if rover.location == coordinates
    end
    beep > 0 ? false : true
  end

  def location_within_range?(coordinates)
    coordinates[Y_COORDINATE] <= @upper_right_coordinates[Y_COORDINATE] && coordinates[Y_COORDINATE] >= 0 &&
    coordinates[X_COORDINATE] >= 0 && coordinates[X_COORDINATE] <= @upper_right_coordinates[X_COORDINATE]
  end
end
