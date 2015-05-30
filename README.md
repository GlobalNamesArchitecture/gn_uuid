Global Names UUID
=================

Generates UUID version 5 from a name string.

Installation
------------

Add this line to your application's Gemfile:

```ruby
gem 'gn_uuid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gn_uuid

Usage
-----

```ruby
require "gn_uuid"

uuid = GlobalNames::UUID.gen("Homo sapiens")
puts uuid.to_s
# output must be: 16f235a0-e4a3-529c-9b83-bd15fe722110
```
Please note that gem uses Global Names Index approach when it generates UUID.

* It deletes all trailing spaces

* It normalizes all internal spaces to a 'usual space' -- the unicode
  character (U+0020)

```ruby
puts GlobalNames::UUID.new(" Homo sapiens").to_s
# output: 16f235a0-e4a3-529c-9b83-bd15fe722110
```
If you prefer to generate UUID from the string as is add an option:

```ruby
uuid = GlobalNames::UUID.new(" Homo sapiens", preprocess: false).to_s
# output: don't know yet
```
It is possible to get binary and decimal representation of uuid

```ruby
uuid = GlobalNames::UUID.new(" Homo sapiens")
puts uuid.to_i
# output:

puts uuid.bin
# output:
```
Development
-----------

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake rspec` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

Contributing
------------

Bug reports and pull requests are welcome on GitHub at
https://github.com/GlobalNamesArchitecture/gn_uuid.

Copyright
---------

The gem is available as open source under the terms of the [MIT License][mit].

UUID library -- [Shyouhei Urabe][shyouhei]
Authors -- [Dmitry Mozzherin][dimus]

Copyright (c) 2015 [Marine Biological Laboratory][mbl].

[mit]: http://opensource.org/licenses/MIT
[shyouhei]: https://github.com/shyouhei
[dimus]: https://github.com/dimus

