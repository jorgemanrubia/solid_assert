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
    #   assert false, StandardError.new("Not XYZ!")  # raise custom exception object
    #   assert false, CustomError  # raise custom exception class
    #
    # @param condition A condition to assert
    # @param exception An optional error message (or exception)
    # @raise {AssertionFailedError} when the condition is not satisfied
    def assert(condition, exception = nil)
      if !condition
        if exception.kind_of?(Exception) or exception.class.eql?(Class)
          raise exception
        else
          raise SolidAssert::AssertionFailedError.new(exception)
        end
      end
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
    #   invariant CustomError do  # custom exception class
    #     ...
    #     some_number == other_number
    #   end
    #
    # @param exception An optional error message (or exception)
    # @yield A block of code
    def invariant(exception = nil)
      assert yield, exception
    end
  end
end
