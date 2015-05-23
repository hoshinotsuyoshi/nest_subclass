module AssignedSubclass
  def subclass(a)
    def a.name
      'Foo::' + self.capitalize
    end
    a
  end
end
