require 'pry'
require 'assigned_subclass'

describe AssignedSubclass do
  before do
    class ::Foo
      extend AssignedSubclass
    end
    @subclass = ::Foo.subclass("hoge")
  end

  it do
    expect(@subclass.name).to eq("Foo::Hoge")
  end
end

