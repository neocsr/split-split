require_relative './pane'

class Screen

  attr_accessor :cols
  attr_accessor :rows
  attr_accessor :panes

  def initialize
    @cols  = [0.0, 1.0]
    @rows  = [0.0, 1.0]
    @panes = [Pane.new]
  end

  def active_pane
    panes.find { |p| p.active? }
  end

  def vsplit
    @cols = split(cols)
    pane, new_pane = active_pane.split_horizontally
    panes << new_pane
  end

  def hsplit
    @rows = split(rows)
    pane, new_pane = active_pane.split_vertically
    panes << new_pane
  end

  def split array
    n = array.length
    (0..n).to_a.map { |e| e/n.to_f }
  end

  def to_layout
    panes.map do |pane|
      pane
        .to_layout(@cols.size - 1, @rows.size - 1)
        .map{ |p| p.round }
    end
  end
end