module AssignedSubclass
  def subclass(name, ruby = '')
    c = Class.new(self) do
      class_eval ruby
    end
    self.const_set(:"#{name.capitalize}", c)
  end
end
