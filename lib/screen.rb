require_relative './pane'

class Screen

  attr_accessor :cols
  attr_accessor :rows
  attr_accessor :pane

  def initialize
    @cols  = [0.0, 1.0]
    @rows  = [0.0, 1.0]
    @pane  = Pane.new
    @vsplit_count = 0
    @hsplit_count = 0
  end

  def generate_cells
    pane.generate_cells
  end

  def find_active
    pane.find_active
  end

  def vsplit
    @cols = split(cols)
    pane.find_active.vsplit
    pane.hupdate_cells(@vsplit_count, @hsplit_count)
    @vsplit_count += 1
  end

  def hsplit
    @rows = split(rows)
    pane.find_active.hsplit
    pane.vupdate_cells(@vsplit_count, @hsplit_count)
    @hsplit_count += 1
  end

  def split array
    n = array.length
    (0..n).to_a.map { |e| e/n.to_f }
  end

  def to_s
    pane.to_s
  end

end