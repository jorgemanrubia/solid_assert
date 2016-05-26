require "singleton"
require "solid_assert/assertion_failed_error"

module SolidAssert

  # Actual assertions implementation
  class Assert
    include Singleton

    # Check if a condition is truthy and fail if it is not.
    #
    # Usage:
    #   assert expr  # raise SolidAssert::AssertionFailedError if expr is falsy
    #   assert !list.empty?, "The list should not be empty"  # optional error message
    #
    # @param condition A condition to assert
    # @param message An optional error message
    # @raise {AssertionFailedError} when the condition is not satisfied
    def assert(condition, message = nil)
      fail SolidAssert::AssertionFailedError.new(message) if !condition
    end

    # Let you {#assert} a block of code.
    #
    # It comes handy when your assertion requires more than one line of code.
    # An assertion is performed on the result of the provided block evaluation.
    #
    # Usage:
    #   invariant do
    #     some_number = 1
    #     other_number = 2
    #     some_number == other_number
    #   end
    #
    #   invariant "Both numbers should be equal" do  # optional error message
    #     ...
    #     some_number == other_number
    #   end
    #
    # @param message An optional error message
    # @raise {AssertionFailedError} when the condition is not satisfied
    # @yield A block of code
    def invariant(message = nil)
      assert yield, message
    end
  end
end
