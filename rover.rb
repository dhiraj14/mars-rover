require_relative "./plateau"
require_relative "./instruction"

class Rover
  include Instruction

  def initialize location, direction, instructions, plateau
    @position = {
      x: location[0].to_i,
      y: location[1].to_i
    }
    @direction = direction
    @plateau = plateau
    @instructions = instructions
  end

  def follow_instruction
    @instructions.each_char do |inst|
      send(inst)
    end
    puts "#{@position[:x]} #{@position[:y]} #{@direction}"
  end

  def within_fence? x, y
    return true if (0..@plateau.width).include?(x) and (0..@plateau.height).include?(y)
    false
  end
end
