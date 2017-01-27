class Plateau
  attr_reader :width, :height

  def initialize dimension
    @width = dimension[0].to_i
    @height = dimension[1].to_i
    @rovers = []
  end

  def deploy_rover location, direction, instructions
    rover = Rover.new(location, direction, instructions, self)
    @rovers << rover
  end

  def execute_rovers
    @rovers.each { |rover| rover.follow_instruction }
  end
end
