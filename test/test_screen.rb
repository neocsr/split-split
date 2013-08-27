require 'test_helper'

class ScreenTest < Minitest::Test

  def setup
    @screen = Screen.new
  end

  def test_initial_state
    pane = @screen.panes.first
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
    assert_equal '[[0.0, 0.0, 0.5, 1.0], [0.5, 0.0, 1.0, 1.0]]',
      @screen.panes.map(&:to_coordinate).inspect
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
    assert_equal '[[0.0, 0.0, 1.0, 0.5], [0.0, 0.5, 1.0, 1.0]]',
      @screen.panes.map(&:to_coordinate).inspect
  end

  def test_layout_hsplit_hsplit
    @screen.hsplit
    @screen.hsplit
    cols = @screen.cols
    rows = @screen.rows
    cells = @screen.to_layout

    assert_equal 3, @screen.panes.size
    assert_equal %w[0.0 1.0], cols.map { |c| sprintf "%.1f" % c }
    assert_equal %w[0.0 0.3 0.7 1.0], rows.map { |r| sprintf "%.1f" % r }
    assert_equal '[[0, 0, 1, 2], [0, 2, 1, 1], [0, 2, 1, 2]]', cells.inspect
    assert_equal '[[0.0, 0.0, 1.0, 0.5], [0.0, 0.5, 1.0, 0.75], [0.0, 0.75, 1.0, 1.0]]',
      @screen.panes.map(&:to_coordinate).inspect
  end

  def test_layout_vsplit_vsplit
    @screen.vsplit
    @screen.vsplit
    cols = @screen.cols
    rows = @screen.rows
    cells = @screen.to_layout

    assert_equal 3, @screen.panes.size
    assert_equal %w[0.0 0.3 0.7 1.0], cols.map { |c| sprintf "%.1f" % c }
    assert_equal %w[0.0 1.0], rows.map { |r| sprintf "%.1f" % r }
    assert_equal '[[0, 0, 2, 1], [2, 0, 1, 1], [2, 0, 2, 1]]', cells.inspect
    assert_equal '[[0.0, 0.0, 0.5, 1.0], [0.5, 0.0, 0.75, 1.0], [0.75, 0.0, 1.0, 1.0]]',
      @screen.panes.map(&:to_coordinate).inspect
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
    assert_equal '[[0.0, 0.0, 0.5, 1.0], [0.5, 0.0, 1.0, 0.5], [0.5, 0.5, 1.0, 1.0]]',
      @screen.panes.map(&:to_coordinate).inspect
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
    assert_equal '[[0.0, 0.0, 1.0, 0.5], [0.0, 0.5, 0.5, 1.0], [0.5, 0.5, 1.0, 1.0]]',
      @screen.panes.map(&:to_coordinate).inspect
  end

end
