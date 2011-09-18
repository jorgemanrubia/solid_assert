module SolidAssert

  # Null assert implementation. Used when the assertions are disabled
  module NullAssert

    # Empty implemention of {Assert#assert}
    def assert(condition, message=nil)
    end

    # Empty implemention of {Assert#invariant}
    def invariant(message=nil)
    end
  end
end
