module AssignedSubclass
  def subclass(name, &block)
    c = Class.new(self) do
      class_eval &block if block
    end
    self.const_set(:"#{name.capitalize}", c)
  end
end
