require 'test_helper'

class PaneTest < Minitest::Test

  def setup
    @pane = Pane.new
  end

  def test_new
    assert_equal 1, @pane.active
    assert_equal '[0, 0, 1, 1]', @pane.to_layout.inspect
  end
end