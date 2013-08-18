require 'minitest/autorun'
require_relative '../lib/screen'

class ScreenTest < Minitest::Test

  def setup
    @screen = Screen.new
  end

  def test_new
    pane = @screen.pane
    assert_equal nil, pane.left
    assert_equal nil, pane.right
    assert_equal true, pane.active?
    puts @screen.pane.to_s
  end

  def test_layout_vsplit
    @screen.vsplit
    puts @screen.pane.to_s
    cols = @screen.cols
    rows = @screen.rows
    cells = @screen.generate_cells

    assert_equal [0, 0.5, 1], cols
    assert_equal [0, 1], rows
    assert_equal [[0, 0, 1, 1], [1, 0, 2, 1]], cells
  end

  def test_layout_hsplit
    @screen.hsplit
    puts @screen.pane.to_s
    cols = @screen.cols
    rows = @screen.rows
    cells = @screen.generate_cells

    assert_equal [0, 1], cols
    assert_equal [0, 0.5, 1], rows
    assert_equal [[0, 0, 1, 1], [0, 1, 1, 2]], cells
  end

  def test_layout_vsplit_hsplit
    @screen.vsplit
    @screen.hsplit
    puts @screen.pane.to_s
    cols = @screen.cols
    rows = @screen.rows
    cells = @screen.generate_cells

    assert_equal [0, 0.5, 1], cols
    assert_equal [0, 0.5, 1], rows
    assert_equal [[0, 0, 1, 2], [1, 0, 2, 1], [1, 1, 2, 2]], cells
  end

  def test_layout_hsplit_vsplit
    @screen.hsplit
    @screen.vsplit
    puts @screen.pane.to_s
    cols = @screen.cols
    rows = @screen.rows
    cells = @screen.generate_cells

    assert_equal [0, 0.5, 1], cols
    assert_equal [0, 0.5, 1], rows
    assert_equal [[0, 0, 2, 1], [0, 1, 1, 2], [1, 1, 2, 2]], cells
  end

  def test_find_active
    pane  = @screen.find_active
    assert_equal true, pane.active?
    puts @screen.pane.to_s
  end

  def test_vplit
    @screen.vsplit
    pane = @screen.pane.left
    assert_equal nil, pane.left
    assert_equal nil, pane.right
    assert_equal false, @screen.pane.active?
    assert_equal true, pane.active?
    puts @screen.pane.to_s
  end

  def test_vplit_twice
    @screen.vsplit
    @screen.vsplit
    pane = @screen.pane.left.left
    assert_equal nil, pane.left
    assert_equal nil, pane.right
    puts @screen.pane.to_s
  end

  def test_hplit
    @screen.hsplit
    pane = @screen.pane.right
    assert_equal nil, pane.left
    assert_equal nil, pane.right
    assert_equal false, @screen.pane.active?
    assert_equal true, pane.active?
    puts @screen.pane.to_s
  end

end
