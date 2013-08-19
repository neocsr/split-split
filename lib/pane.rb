require_relative './point'

class Pane
  attr_reader :origin
  attr_reader :size
  attr_accessor :active

  def initialize origin = Point.new(0.0, 0.0), size = Point.new(1.0, 1.0)
    @origin = origin
    @size = size
    @active = 1
  end

  def active?
    active == 1
  end

  def contract_height
    @size.height /= 2
    new_origin = Point.new(@origin.x, @origin.y + @size.height)
    [new_origin, @size]
  end

  def contract_width
    @size.width /= 2
    new_origin = Point.new(@origin.x + @size.width, @origin.y)
    [new_origin, @size]
  end

  def to_layout xscale = 1, yscale = 1
    [ xscale * origin.x,
      yscale * origin.y,
      xscale * (origin.x + size.width),
      yscale * (origin.y + size.height) ]
  end
end
