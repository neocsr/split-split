class Pane
  attr_accessor :left
  attr_accessor :right
  attr_accessor :active
  attr_accessor :cells

  def initialize cells = [0, 0, 1, 1]
    @left = nil
    @right = nil
    @active = 1
    @cells = cells
  end

  def active?
    active == 1
  end

  def find_active
    if active?
      self
    elsif left && left.active?
      left
    elsif right && right.active?
      right
    else
      nil
    end
  end

  def vsplit
    return left if left
    @active = 0
    self.left = Pane.new xtranslate(cells.dup)
  end

  def hsplit
    return right if right
    @active = 0
    self.right = Pane.new ytranslate(cells.dup)
  end

  def vupdate_cells vsplit_count, hsplit_count
    @cells[3] += 1 if vsplit_count > 0
  end

  def hupdate_cells vsplit_count, hsplit_count
    @cells[2] += 1 if hsplit_count > 0
  end

  def generate_cells
    all_cells = [self.cells]
    all_cells += left.generate_cells if left
    all_cells += right.generate_cells if right
    all_cells
  end

  def xtranslate clls
    clls[0] += 1
    clls[2] += 1
    clls
  end

  def ytranslate clls
    clls[1] += 1
    clls[3] += 1
    clls
  end

  def to_s
    out = '['
    out += (left  ? left.to_s  : "-")
    out += (self  ? "#{self.active}"  : "-")
    out += (right ? right.to_s : "-")
    out += ']'
    out
  end
end
