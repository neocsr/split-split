require_relative './point'

class Frame
  attr_reader :origin
  attr_reader :size

  def initialize origin = Point.new(0.0, 0.0), size = Point.new(1.0, 1.0)
    @origin = origin
    @size = size
  end

  def increase_height
    @size.height += 1
  end

  def decrease_height
    @size.height -= 1
  end

  def increase_width
    @size.width += 1
  end

  def decrease_width
    @size.width -= 1
  end

  def to_layout xscale = 1, yscale = 1
    [ xscale * origin.x,
      yscale * origin.y,
      xscale * (origin.x + size.width),
      yscale * (origin.y + size.height) ]
  end
end