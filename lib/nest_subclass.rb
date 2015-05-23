require "nest_subclass/version"

module NestSubclass
  def subclass(name, &block)
    c = Class.new(self, &block)
    self.const_set(:"#{name.capitalize}", c)
  end
end
