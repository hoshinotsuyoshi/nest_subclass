module AssignedSubclass
  def subclass(a)
    c = Class.new(self)
    def c.name
      'Foo::Hoge' #+ self.capitalize
    end
    c
  end
end
