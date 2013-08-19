require 'test_helper'

class ScreenTest < Minitest::Test

  def setup
    @screen = Screen.new
  end

  def test_initial_state
    pane = @screen.panes.first
    assert_equal true, pane.active?
    assert_equal '[[0, 0, 1, 1]]', @screen.to_layout.inspect
  end

  def test_layout_vsplit
    @screen.vsplit
    cols = @screen.cols
    rows = @screen.rows
    cells = @screen.to_layout

    assert_equal 2, @screen.panes.size
    assert_equal [0, 0.5, 1], cols
    assert_equal [0, 1], rows
    assert_equal '[[0, 0, 1, 1], [1, 0, 2, 1]]', cells.inspect
  end

  def test_layout_hsplit
    @screen.hsplit
    cols = @screen.cols
    rows = @screen.rows
    cells = @screen.to_layout

    assert_equal 2, @screen.panes.size
    assert_equal [0, 1], cols
    assert_equal [0, 0.5, 1], rows
    assert_equal '[[0, 0, 1, 1], [0, 1, 1, 2]]', cells.inspect
  end

  def test_layout_vsplit_hsplit
    @screen.vsplit
    @screen.hsplit
    cols = @screen.cols
    rows = @screen.rows
    cells = @screen.to_layout

    assert_equal 3, @screen.panes.size
    assert_equal [0, 0.5, 1], cols
    assert_equal [0, 0.5, 1], rows
    assert_equal '[[0, 0, 1, 2], [1, 0, 2, 1], [1, 1, 2, 2]]', cells.inspect
  end

  def test_layout_hsplit_vsplit
    @screen.hsplit
    @screen.vsplit
    cols = @screen.cols
    rows = @screen.rows
    cells = @screen.to_layout

    assert_equal [0, 0.5, 1], cols
    assert_equal [0, 0.5, 1], rows
    assert_equal '[[0, 0, 2, 1], [0, 1, 1, 2], [1, 1, 2, 2]]', cells.inspect
  end

end
