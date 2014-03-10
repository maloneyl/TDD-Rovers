require "pry"
require "pry-byebug"
require_relative "plateau"
require_relative "mars_rover"

puts `clear` + "Plateau's upper-right coordinates (e.g. 5 5):\n"
plateau_upper_right_coordinates = gets.chomp
plateau = Plateau.new(plateau_upper_right_coordinates)

puts "Mars Rover 1's existing location and heading (e.g. 1 2 N):\n"
rover1_location_and_heading = gets.chomp
rover1 = MarsRover.new(rover1_location_and_heading, plateau)
plateau.rovers << rover1
puts "Instructions for Mars Rover 1 (e.g. LMLMLMLMM):\n"
rover1_instructions = gets.chomp
rover1.spin_and_move(rover1_instructions)

puts "Mars Rover 2's existing location and heading (e.g. 3 3 E):\n"
rover2_location_and_heading = gets.chomp
rover2 = MarsRover.new(rover2_location_and_heading, plateau)
plateau.rovers << rover2
puts "Instructions for Mars Rover 2 (e.g. MMRMMRMRRM):\n"
rover2_instructions = gets.chomp
rover2.spin_and_move(rover2_instructions)

puts "Mars Rover 1's new location and heading:\n#{rover1.location[0]} #{rover1.location[1]} #{rover1.heading}"
puts "Mars Rover 2's new location and heading:\n#{rover2.location[0]} #{rover2.location[1]} #{rover2.heading}"







