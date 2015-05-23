# NestSubclass

[![Build Status](https://travis-ci.org/hoshinotsuyoshi/nest_subclass.svg)](https://travis-ci.org/hoshinotsuyoshi/nest_subclass)

`NestSubclass#subclass` creates a subclass nested by self

## Usage

```ruby
require 'nest_subclass'

class A
  extend NestSubclass
end

A.subclass('b') do
  def b?
    true
  end
end
#=> A::B

A::B.subclass('c') do
  def c?
    true
  end
end
#=> A::B::C

instance = A::B::C.new
#=> #<A::B::C:0x007f9350a64100>

instance.b?
#=> true

instance.c?
#=> true

```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nest_subclass'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nest_subclass

## Contributing

1. Fork it ( https://github.com/[my-github-username]/nest_subclass/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
