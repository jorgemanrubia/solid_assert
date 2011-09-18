require "spec_helper"

describe SolidAssert::NullAssert do
  before(:all) do
    Object.class_eval do
      include SolidAssert::NullAssert
    end
  end

  describe "#assert" do
    it "should do nothing without message" do
      assert false
    end

    it "should do nothing with message" do
      assert false, "Some message"
    end
  end

  describe "#invariants" do
    it "should do nothing without message" do
      invariant do
        false
      end
    end

    it "should do nothing with message" do
      invariant "Some message" do
        false
      end
    end
  end

end