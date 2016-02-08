require "spec_helper"

describe SolidAssert::Assert do
  include SolidAssert::Assert

  class CustomExceptionClass < StandardError ; end

  describe "#assert" do
    context "without assertion message" do
      it "fails when condition is false" do
        expect { assert false }.to raise_error(SolidAssert::AssertionFailedError)
      end

      it "fails when condition evaluates to false" do
        expect { assert nil }.to raise_error(SolidAssert::AssertionFailedError)
      end

      it "doesn't fail when condition is true" do
        expect { assert true }.not_to raise_error
      end

      it "doesn't fail when condition evaluates to true" do
        expect { assert "this evaluates to true" }.not_to raise_error
      end
    end

    context "with assertion message" do
      it "raises error with a specified message when condition evaluates to false" do
        expect { assert nil, "a message" }.to raise_error(SolidAssert::AssertionFailedError, "a message")
      end

      it "doesn't raise any error when condition doesn't evaluate to false" do
        expect { assert "this evaluates to true", "a message" }.not_to raise_error
      end
    end

    context "with exception class" do
      it "raises exception of the specified class" do
        expect { assert false, CustomExceptionClass }.to raise_error(CustomExceptionClass)
      end
    end

    describe "with exception object" do
      it "raises a specified exception object" do
        error = CustomExceptionClass.new("a message")
        expect { assert false, error }.to raise_error(error)
      end
    end
  end

  describe "#invariants" do
    context "without assertion message" do
      it "invokes #assert with a result of the provided block" do
        expect(self).to receive(:assert).with("a result", nil)
        invariant do
          "a block"
          "a result"
        end
      end
    end

    context "with assertion message" do
      it "invokes #assert with a result of the provided block and an assertion message" do
        expect(self).to receive(:assert).with("a result", "a message")
        invariant "a message" do
          "a block"
          "a result"
        end
      end
    end
  end
end
