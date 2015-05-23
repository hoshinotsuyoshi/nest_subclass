module AssignedSubclass
  def subclass(*args)
    a = ''
    def a.name
      'Foo::Hoge'
    end
    a
  end
end
