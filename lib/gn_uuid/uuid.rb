module GnUUID
  # handles UUID byte string and it's conversion  to different format
  # NOTE: this is a general UUID class which is not limited to only v5
  class UUID
    attr_reader :bytes

    def initialize(bytes)
      @bytes = bytes
      @ary = @bytes.unpack("C*")
    end

    def to_s
      return @str if @str
      fmt = "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-" \
            "%02x%02x%02x%02x%02x%02x"
      @str = fmt % @ary
    end

    def to_i
      @num ||= @ary.inject(0) { |a, e| a << 8 | e }
    end

    def to_uri
      "urn:uuid:" + to_s
    end

    def version
      @ary[6] >> 4
    end
  end
end
