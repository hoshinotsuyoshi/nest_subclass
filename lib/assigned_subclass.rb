module AssignedSubclass
  def subclass(name)
    c = Class.new(self) do
      def hoge
        :hoge!
      end
    end
    self.const_set(:"#{name.capitalize}", c)
  end
end
