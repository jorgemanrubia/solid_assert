require "spec_helper"

describe SolidAssert::Assert do
  subject { described_class.instance }

  class CustomExceptionClass < StandardError ; end

  describe "#assert" do
    context "without assertion message" do
      it "fails when condition is false" do
        expect { subject.assert false }.to raise_error(SolidAssert::AssertionFailedError)
      end

      it "fails when condition evaluates to false" do
        expect { subject.assert nil }.to raise_error(SolidAssert::AssertionFailedError)
      end

      it "doesn't fail when condition is true" do
        expect { subject.assert true }.not_to raise_error
      end

      it "doesn't fail when condition evaluates to true" do
        expect { subject.assert "this evaluates to true" }.not_to raise_error
      end
    end

    context "with assertion message" do
      it "fails with a specified message when condition is false" do
        expect { subject.assert false, "message" }.to raise_error(SolidAssert::AssertionFailedError, "message")
      end

      it "fails with a specified message when condition evaluates to false" do
        expect { subject.assert nil, "message" }.to raise_error(SolidAssert::AssertionFailedError, "message")
      end

      it "doesn't fail when condition is true" do
        expect { subject.assert true, "message" }.not_to raise_error
      end

      it "doesn't fail when condition evaluates to true" do
        expect { subject.assert "this evaluates to true", "message" }.not_to raise_error
      end
    end
  end

  describe "#invariants" do
    context "without assertion message" do
      it "invokes #assert with a result of the provided block" do
        expect(subject).to receive(:assert).with("result", nil)
        subject.invariant do
          "block"
          "result"
        end
      end
    end

    context "with assertion message" do
      it "invokes #assert with a result of the provided block and an assertion message" do
        expect(subject).to receive(:assert).with("result", "message")
        subject.invariant "message" do
          "block"
          "result"
        end
      end
    end
  end
end
