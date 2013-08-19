require 'test_helper'

class FrameTest < Minitest::Test

  def setup
    @frame = Frame.new
  end

  def test_to_layout
    layout = @frame.to_layout
    assert_equal [0, 0, 1, 1], layout
  end

  def test_increase_height
    @frame.increase_height
    assert_equal [0, 0, 1, 2], @frame.to_layout
  end

  def test_decrease_height
    @frame.decrease_height
    assert_equal [0, 0, 1, 0], @frame.to_layout
  end

  def test_increase_width
    @frame.increase_width
    assert_equal [0, 0, 2, 1], @frame.to_layout
  end

  def test_decrease_width
    @frame.decrease_width
    assert_equal [0, 0, 0, 1], @frame.to_layout
  end

end