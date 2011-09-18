require "spec_helper"

describe SolidAssert::Assert do
  before(:each) do
    Object.include(SolidAssert::Assert)
  end

  describe "without assertion message" do
    it "should fail when condition is false" do
      lambda{assert false}.should_raise AssertionError
    end
  end
end