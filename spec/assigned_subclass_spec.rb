require 'pry'
require 'assigned_subclass'

describe AssignedSubclass do
  it do
    class ::Foo
      extend AssignedSubclass
    end
    subclass = ::Foo.subclass("hoge")

    expect(subclass.name).to eq("Foo::Hoge")
  end
end

