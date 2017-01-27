module Instruction
  TURN = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }

  MOVE = {
    'N' => [0, 1],
    'E' => [1, 0],
    'S' => [0, -1],
    'W' => [-1, 0]
  }

  def method_missing(name)
    puts "Invalid Instruction #{name}"
  end

  private

  def L #instruction to turn left
    @direction = TURN[@direction]
  end

  def R #instruction to turn right
    @direction = TURN.rassoc(@direction)[0]
  end

  def M #instruction to move forward
    new_x = @position[:x] + MOVE[@direction][0]
    new_y = @position[:y] + MOVE[@direction][1]
    if within_fence?(new_x, new_y)
      @position[:x] = new_x
      @position[:y] = new_y
    end
  end
end
