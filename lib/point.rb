class Point
  attr_accessor :x, :y
  alias_method :width, :x
  alias_method :height, :y
  alias_method :width=, :x=
  alias_method :height=, :y=

  def initialize x, y
    @x = x
    @y = y
  end

  def +(point)
    Point.new x + point.x, y + point.y
  end

  def -(point)
    Point.new x - point.x, y - point.y
  end
end
