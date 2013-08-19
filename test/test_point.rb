require 'test_helper'

class PointTest < Minitest::Test

  def setup
    @p1 = Point.new 10, 20
    @p2 = Point.new 3, 12
  end

  def test_addition
    p3 = @p1 + @p2

    assert_equal 13, p3.x
    assert_equal 32, p3.y
  end

  def test_subtraction
    p3 = @p1 - @p2

    assert_equal 7, p3.x
    assert_equal 8, p3.y
  end

  def test_alias
    assert_equal 10, @p1.width
    assert_equal 20, @p1.height
  end
end