require "digest/sha1"
require "gn_uuid/version"
require "gn_uuid/uuid"

# UUID version 5 with DNS|globalnames.org namespace
module GnUUID
  GN_NAMESPACE = "\x90\x18\x11\x96\xFE\xCFP\x82\xA4\xC1A\x1DO1L\xDA"

  class << self
    def uuid(str, guid = true)
      sha1 = Digest::SHA1.new
      sha1.update(GN_NAMESPACE)
      sha1.update(str)
      res = GnUUID::UUID.new(stamp_v5(sha1.digest[0..15]))
      guid ? res.to_s : res
    end

    def parse(obj)
      str = obj.to_s.gsub(/\Aurn:uuid:/, "")
      str.gsub!(/[^0-9A-Fa-f]/, "")
      GnUUID::UUID.new([str[0..31]].pack("H*"))
    end

    private

    def stamp_v5(str)
      str[6] = (str[6].ord & 0b1111 | 0b101_0000).chr
      str[8] = (str[8].ord & 0b11_1111 | 0b1000_0000).chr
      str
    end
  end
end
