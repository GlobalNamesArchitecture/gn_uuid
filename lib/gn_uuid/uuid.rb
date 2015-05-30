module GnUUID
  class UUID
    attr_reader :bytes

    def initialize(bytes)
      @bytes = bytes
      @ary = @bytes.unpack("C*")
    end

    def to_s
      "%x%x%x%x-%x%x-%x%x-%x%x-%x%x%x%x%x%x" % @ary
    end

    def to_i
      @num ||= @ary.each_with_object(0b0) { |i, obj| obj = obj << 8  | i }
    end
  end
end
