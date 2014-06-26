module SolidAssert
  module Assert

    # Expresses a condition and fails if the condition is not satisfied
    #
    # Usage
    #   assert false
    #   assert not_nil_object
    #   assert !list.empty?, "The list should not be empty at this point"
    #   assert xyz, StandardError.new("Not XYZ!")
    #   assert abc, CustomExceptionClass
    #
    # @param condition The condition to assert
    # @param exception The optional message or exception when the condition is not satisfied
    # @raise {AssertionFailedError} when the condition is not satisfied
    def assert(condition, exception=nil)
      if !condition
        if exception.kind_of?(Exception) or exception.class.eql?(Class)
          raise exception
        else
          raise SolidAssert::AssertionFailedError.new(exception)
        end
      end
    end

    # Let you {#assert} a block of code. It comes handy when your assertion requires more than one lines of code
    # Usage:
    #   invariant do
    #     some_number = 1
    #     other_number = 2
    #     some_number == other_number
    #   end
    #
    #   invariant "Both numbers should be equal" do
    #     some_number = 1
    #     other_number = 2
    #     some_number == other_number
    #   end
    # @param exception The optional message or exception when the block doesn't evaluates to a satisfied condition
    # @yield The block that will be evaluated for deciding whether the condition is satisfied
    def invariant(exception=nil)
      assert yield, exception
    end
  end
end
