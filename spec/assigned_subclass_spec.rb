require 'pry'
require 'assigned_subclass'

describe AssignedSubclass do
  before(:all) do
    class ::Foo
      extend AssignedSubclass
    end
    @subclass = ::Foo.subclass("hoge")
    @subclass_2 = ::Foo::Hoge.subclass("another")
  end

  it do
    expect(@subclass.name).to eq("Foo::Hoge")
  end

  it do
    expect(@subclass.superclass).to be Foo
  end

  it do
    expect(@subclass_2.superclass).to be Foo::Hoge
  end

  it do
    class ::Bar
      extend AssignedSubclass
    end
    ruby = <<-RUBY
      def hoge
        :hoge!
      end
    RUBY
    sub = ::Bar.subclass("hoge", ruby)
    expect(sub.new.hoge).to be :hoge!
  end
end

