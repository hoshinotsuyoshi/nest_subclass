module AssignedSubclass
  def subclass(name, ruby = '')
    c = Class.new(self)
    c = self.const_set(:"#{name.capitalize}", c)
    c.class_eval ruby
    c
  end
end
