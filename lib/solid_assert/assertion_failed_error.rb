module SolidAssert

  class AssertionFailedError < StandardError
    def initialize(message=nil)
      super
    end
  end

end

