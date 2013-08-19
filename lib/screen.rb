require_relative './pane'
require_relative './frame'

class Screen

  attr_accessor :cols
  attr_accessor :rows
  attr_accessor :panes
  attr_accessor :frame

  def initialize
    @cols  = [0.0, 1.0]
    @rows  = [0.0, 1.0]
    @frame = Frame.new
    @panes = [Pane.new]
  end

  def active_pane
    panes.find { |p| p.active? }
  end

  def add_pane origin, size
    panes << Pane.new(origin.dup, size.dup)
  end

  def new_origin
    (frame.origin + frame.size) - (active_pane.origin + active_pane.size)
  end

  def new_size origin
    frame.size - origin
  end

  def vsplit
    @cols = split(cols)
    pane = active_pane
    pane.active = 0
    origin, size = pane.contract_width
    add_pane(origin, size)
  end

  def hsplit
    @rows = split(rows)
    pane = active_pane
    pane.active = 0
    origin, size = pane.contract_height
    add_pane(origin, size)
  end

  def split array
    n = array.length
    (0..n).to_a.map { |e| e/n.to_f }
  end

  def to_layout
    panes
      .map do |pane|
        pane.to_layout(@cols.size - 1, @rows.size - 1)
            .map{ |p| p.round }
      end
  end

end