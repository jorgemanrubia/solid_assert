require "spec_helper"

describe SolidAssert::Assert do
  describe ".enable_assertions" do
    it "should make the Object class to include the Assertions module" do
      Object.should_receive(:include).with(SolidAssert::Assert)
      SolidAssert.enable_assertions
    end
  end
end