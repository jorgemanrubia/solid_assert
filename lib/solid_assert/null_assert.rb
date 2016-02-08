require "singleton"

module SolidAssert

  # Null assertions implementation (used when the assertions are disabled).
  class NullAssert
    include Singleton

    # Empty implemention of {Assert#assert}.
    def assert(condition, message = nil)
    end

    # Empty implemention of {Assert#invariant}.
    def invariant(message = nil)
    end
  end
end
