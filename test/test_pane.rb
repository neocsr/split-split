require 'test_helper'

class PaneTest < Minitest::Test

  def setup
    @pane = Pane.new
  end

  def test_new
    assert_equal 1, @pane.active
    assert_equal [0.0, 0.0, 1.0, 1.0], @pane.to_coordinate
    assert_equal '[0, 0, 1, 1]', @pane.to_layout.inspect
  end

  def test_split_horizontally
    original, created = @pane.split_horizontally

    refute original.active?
    assert created.active?
    assert_equal [0.0, 0.0, 0.5, 1.0], original.to_coordinate
    assert_equal [0.5, 0.0, 1.0, 1.0], created.to_coordinate
    assert_equal '[1, 0, 2, 1]', created.to_layout(2, 1).inspect
  end

  def test_split_vertically
    original, created = @pane.split_vertically

    refute original.active?
    assert created.active?
    assert_equal [0.0, 0.0, 1.0, 0.5], original.to_coordinate
    assert_equal [0.0, 0.5, 1.0, 1.0], created.to_coordinate
    assert_equal '[0, 1, 1, 2]', created.to_layout(1, 2).inspect
  end
end
