class Rover
  attr_reader :direction, :position

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
    @compass = %w[N E S W]
    @vectors = [[0, 1], [1, 0], [0, -1], [1, 0]]
  end

  def go(instructions)
    instructions.split("").each do | command |
      {
        'R' => -> { right },
        'L' => -> { left },
        'F' => -> { forward },
        'B' => -> { back }
      }[command].call
    end
  end

  def position
    [@x, @y]
  end

  private

  def back
    vector = @vectors[direction_index]
    @x -= vector[0]
    @y -= vector[1]
  end

  def forward
    vector = @vectors[direction_index]
    @x += vector[0]
    @y += vector[1]
  end

  def left
    @direction = @compass[direction_index - 1]
  end

  def right
    @direction = @compass[direction_index + 1]
  end

  def direction_index
    @compass.index(@direction)
  end
end
