require "spec_helper"

describe SolidAssert::Assert do
  include SolidAssert::Assert

  describe "#assert" do
    describe "without assertion message" do
      it "should fail when condition is false" do
        expect { assert false }.to raise_error SolidAssert::AssertionFailedError
      end

      it "should fail when condition evaluates to false" do
        expect { assert nil }.to raise_error SolidAssert::AssertionFailedError
      end

      it "should not fail when condition is true" do
        expect { assert true }.to_not raise_error SolidAssert::AssertionFailedError
      end

      it "should not fail when condition evaluates to true" do
        expect { assert "This evaluates to true" }.to_not raise_error SolidAssert::AssertionFailedError
      end
    end

    describe "with assertion message" do
      it "should raise error with specified message when condition evaluates to false" do
        expect { assert nil, "The error message" }.to raise_error(SolidAssert::AssertionFailedError, "The error message")
      end

      it "should not raise any error when condition doesn't evaluate to false'" do
        expect { assert 'This evaluates to true', "The error message" }.to_not raise_error(SolidAssert::AssertionFailedError)
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