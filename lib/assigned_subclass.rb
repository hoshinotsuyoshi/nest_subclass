module AssignedSubclass
  def subclass(name)
    c = Class.new(self)
    self.const_set(:"#{name.capitalize}", c)
  end
end
