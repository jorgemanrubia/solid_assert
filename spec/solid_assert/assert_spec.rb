require "spec_helper"

describe SolidAssert::Assert do
  before(:all) do
    Object.class_eval do
      include SolidAssert::Assert
    end
  end

  describe "#assert" do
    describe "without assertion message" do
      it "should fail when condition is false" do
        lambda { assert false }.should raise_error SolidAssert::AssertionFailedError
      end

      it "should fail when condition evaluates to false" do
        lambda { assert nil }.should raise_error SolidAssert::AssertionFailedError
      end

      it "should not fail when condition is true" do
        lambda { assert true }.should_not raise_error SolidAssert::AssertionFailedError
      end

      it "should not fail when condition evaluates to true" do
        lambda { assert "This evaluates to true" }.should_not raise_error SolidAssert::AssertionFailedError
      end
    end

    describe "with assertion message" do
      it "should raise error with specified message when condition evaluates to false" do
        lambda { assert nil, "The error message" }.should raise_error(SolidAssert::AssertionFailedError, "The error message")
      end

      it "should not raise any error when condition doesn't evaluate to false'" do
        lambda { assert 'This evaluates to true', "The error message" }.should_not raise_error(SolidAssert::AssertionFailedError)
      end
    end
  end

  describe "#invariants" do
    it "should invoke assert with the provided block" do
      self.should_receive(:assert).with('This is the invariant block', nil)
      invariant { "This is the invariant block" }
    end

    it "should invoke assert with the provided block and the provided error message" do
      self.should_receive(:assert).with('This is the invariant block', 'the error message')
      invariant "the error message" do
        "This is the invariant block"
      end
    end
  end

end