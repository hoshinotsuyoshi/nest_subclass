require 'nest_subclass'

describe NestSubclass do
  describe '.subclass' do
    before(:all) do
      class ::Foo
        extend NestSubclass
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
        extend NestSubclass
      end

      sub = ::Bar.subclass("hoge") do
        def hoge
          :hoge!
        end
      end

      expect(sub.new.hoge).to be :hoge!
    end

    it do
      class ::Boo
        extend NestSubclass
      end
      k = ::Boo.subclass("hoge") do
        def hoge
          :yellow
        end
      end.subclass("another") do
        def hoge
          super.to_s + " blue"
        end
      end

      expect(k.new.hoge).to eq('yellow blue')
    end

    it do
      expect do
        k = nil
        2.times do
          class ::Too
            extend NestSubclass
          end
          k = ::Too.subclass("hoge") do
            def hoge
              :green
            end
          end.subclass("another") do
            def hoge
              super.to_s + " blue"
            end
          end
        end

        expect(k.new.hoge).to eq('green blue')
      end.to output(/warning/).to_stderr
    end
  end
end
