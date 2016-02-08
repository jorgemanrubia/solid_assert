require "spec_helper"

describe SolidAssert::Assert do
  it "uses the NullAssert implementation by default" do
    expect do
      assert false
      invariant { false }
    end.not_to raise_error
  end

  describe "::enable_assertions" do
    it "appends Assert module into the Object class" do
      expect(Object).to receive(:include).with(SolidAssert::Assert)
      SolidAssert.enable_assertions
    end
  end
end
