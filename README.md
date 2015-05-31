Global Names UUID
=================

[![Gem Version][gem_badge]][gem_link]
[![Continuous Integration Status][ci_badge]][ci_link]
[![Coverage Status][cov_badge]][cov_link]
[![CodeClimate][code_badge]][code_link]
[![Dependency Status][dep_badge]][dep_link]

Gem `gn_uuid` creates UUID version 5 out of scientific name string. It
uses `globalnames.org` domain for DNS namespace. There is a 1:1 relationship
between the string and the corresponding UUID, so it allows globally connect
data about a name string originated from independent sources without a need
to negotiate identifiers. You can find more information about UUID v5 from
the original [RFC4122][rfc] document.

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

#### GnUUID.uuid(string, guid = true)

 Parameter | Type    | Description
-----------|---------|----------------------------------------------------------
 str       | String  | Scientific Name String
 guid      | Boolean | `true` returns a String guid, `false` -- UUID object; *default* `true`

```ruby
require "gn_uuid"

uuid = GnUUID.uuid("Homo sapiens")
# output: 16f235a0-e4a3-529c-9b83-bd15fe722110
```
If you plan to convert uuid into its other formats use

```ruby
uuid = GnUUID.uuid("Homo sapiens", false)
# output: urn:uuid:b33e4b19-2399-56c8-9dd3-eff79f221d2f

# as a 'stanard guid'
uuid.to_s
# output: b33e4b19-2399-56c8-9dd3-eff79f221d2f

# as an decimal integer
uuid.to_i
# output: 30500639462008600581628158843502600464

# as an URI
uuid.to_uri
uuid.inspect (alias_method for to_uri)
# output: urn:uuid:b33e4b19-2399-56c8-9dd3-eff79f221d2f


# as a 16-bytes string
uuid.bytes
# output: "\x16\xF25\xA0\xE4\xA3R\x9C\x9B\x83\xBD\x15\xFEr!\x10"

# return UUID version
uuid.version
# output: 5
```
Please note that the internal GnUUID::UUID does not have to be of the version
5, but GnUUID.uuid generates only version 5 UUIDs

#### GnUUID.parse(uuid)

Takes a uuid string like "b33e4b19-2399-56c8-9dd3-eff79f221d2f" and returns an
instance of GnUUID::UUID class. It can parse any UUID, not only version 5

```ruby
uuid = GnUUID.parse("b33e4b19-2399-56c8-9dd3-eff79f221d2f")
uuid.inspect
# output: urn:uuid:b33e4b19-2399-56c8-9dd3-eff79f221d2f
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

Acknowledgement
---------------

This gem heavily borrowed ideas and code from [Urabe Shyouhei's][shyouhei]
[ruby-uuid gem][uuidgem]

Copyright
---------

The gem is available as open source under the terms of the [MIT License][mit].

Author -- [Dmitry Mozzherin][dimus]

Copyright (c) 2015 [Marine Biological Laboratory][mbl].

[gem_badge]: https://badge.fury.io/rb/gn_uuid.svg
[gem_link]: http://badge.fury.io/rb/gn_uuid
[ci_badge]: https://secure.travis-ci.org/GlobalNamesArchitecture/gn_uuid.svg
[ci_link]: http://travis-ci.org/GlobalNamesArchitecture/gn_uuid
[cov_badge]: https://coveralls.io/repos/GlobalNamesArchitecture/gn_uuid/badge.svg?branch=master
[cov_link]: https://coveralls.io/r/GlobalNamesArchitecture/gn_uuid?branch=master
[code_badge]: https://codeclimate.com/github/GlobalNamesArchitecture/gn_uuid/badges/gpa.svg
[code_link]: https://codeclimate.com/github/GlobalNamesArchitecture/gn_uuid
[dep_badge]: https://gemnasium.com/GlobalNamesArchitecture/gn_uuid.png
[dep_link]: https://gemnasium.com/GlobalNamesArchitecture/gn_uuid
[rfc]: https://www.ietf.org/rfc/rfc4122.txt
[mit]: http://opensource.org/licenses/MIT
[shyouhei]: https://github.com/shyouhei
[uuidgem]: https://github.com/shyouhei/ruby-uuid
[dimus]: https://github.com/dimus
[mbl]: http://mbl.edu
