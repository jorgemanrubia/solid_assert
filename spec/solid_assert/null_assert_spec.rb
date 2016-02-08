require "spec_helper"

describe SolidAssert::NullAssert do
  include SolidAssert::NullAssert

  describe "#assert" do
    context "without assertion message" do
      it "does nothing" do
        expect { assert false }.not_to raise_error
      end
    end

    context "with assertion message" do
      it "does nothing" do
        expect { assert false, "a message" }.not_to raise_error
      end
    end
  end

  describe "#invariant" do
    context "without assertion message" do
      it "does nothing" do
        expect do
          invariant { false }
        end.not_to raise_error
      end
    end

    context "with assertion message" do
      it "does nothing" do
        expect do
          invariant("a message") { false }
        end.not_to raise_error
      end
    end
  end
end
