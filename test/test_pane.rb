require 'minitest/autorun'
require_relative '../lib/pane'

class PaneTest < Minitest::Test

  def setup
    @pane = Pane.new
  end

  def test_new
    assert_nil @pane.left
    assert_nil @pane.right
    assert_equal 1, @pane.active
  end

end