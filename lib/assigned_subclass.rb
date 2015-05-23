module AssignedSubclass
  def subclass(a)
    c = Class.new(self)
    self.const_set(:Hoge, c)
  end
end
