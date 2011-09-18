require "spec_helper"

describe SolidAssert::Assert do
  describe ".enable_assertions" do
    it "should make the Object class to include the Assertions module" do
      Object.should_receive(:include).with(SolidAssert::Assert)
      SolidAssert.enable_assertions
    end

    it "should turn on the assertions" do
      SolidAssert.enable_assertions
      lambda{assert false}.should raise_error(SolidAssert::AssertionFailedError)
    end
  end

  describe ".disable_assertions" do
    it "should make the Object class to include the EmptyAssertions module" do
      Object.should_receive(:include).with(SolidAssert::NullAssert)
      SolidAssert.disable_assertions
    end

    it "should enable blank assertions, when these have been enabled previously" do
      SolidAssert.disable_assertions
      lambda{assert false}.should_not raise_error(SolidAssert::AssertionFailedError)
    end

    it "should disabled assertions, if these have been enabled previously" do
      SolidAssert.enable_assertions
      SolidAssert.disable_assertions
      lambda{assert false}.should_not raise_error(SolidAssert::AssertionFailedError)
    end

  end
end

