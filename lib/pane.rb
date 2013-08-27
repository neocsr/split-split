class Pane

  attr_reader :x
  attr_reader :y
  attr_reader :width
  attr_reader :height
  attr_accessor :active

  def initialize x = 0.0, y = 0.0, width = 1.0, height = 1.0
    @x = x
    @y = y
    @width = width
    @height = height
    @active = 1
  end

  def active?
    active == 1
  end

  def split_vertically
    @height /= 2.0
    @active = 0
    [self, Pane.new(@x, @y + @height, @width, @height)]
  end

  def split_horizontally
    @width /= 2.0
    @active = 0
    [self, Pane.new(@x + @width, @y, @width, @height)]
  end

  def to_a
    [x, y, width, height]
  end

  def to_coordinate
    [x, y, x + width, y + height]
  end

  def to_layout x_scale = 1, y_scale = 1
    [ x_scale * x,
      y_scale * y,
      x + (x_scale * width),
      y + (y_scale * height) ].map(&:round)
  end
end
