require "nest_subclass/version"
require "active_support"
require "active_support/core_ext/string/inflections"

module NestSubclass
  def subclass(name, &block)
    c = Class.new(self, &block)
    self.const_set(:"#{name.camelize}", c)
  end
end
