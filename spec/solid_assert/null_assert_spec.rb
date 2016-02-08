require "spec_helper"

describe SolidAssert::NullAssert do
  subject { described_class.instance }

  describe "#assert" do
    it "does nothing" do
      expect do
        subject.assert false
        subject.assert false, "message"
      end.not_to raise_error
    end
  end

  describe "#invariant" do
    it "does nothing" do
      expect do
        subject.invariant { false }
        subject.invariant("message") { false }
      end.not_to raise_error
    end
  end
end
