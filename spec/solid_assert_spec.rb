require "spec_helper"

describe SolidAssert do
  context "assertions enabled" do
    before do
      SolidAssert.enable_assertions
    end

    describe ".assert_instance" do
      it "is equal to SolidAssert::Assert instance" do
        expect(SolidAssert.assert_instance).to eq(SolidAssert::Assert.instance)
      end
    end

    describe "#assert" do
      it "is delegated to SolidAssert::Assert instance" do
        expect(SolidAssert::Assert.instance).to receive(:assert).with("condition", "message")
        assert "condition", "message"
      end
    end

    describe "#invariant" do
      it "is delegated to SolidAssert::Assert instance" do
        expect(SolidAssert::Assert.instance).to receive(:invariant).with("message").and_call_original
        expect(SolidAssert::Assert.instance).to receive(:assert).with("condition", "message")
        invariant("message") { "condition" }
      end
    end
  end

  context "assertions disabled" do
    before do
      SolidAssert.disable_assertions
    end

    describe ".assert_instance" do
      it "is equal to SolidAssert::NullAssert instance" do
        expect(SolidAssert.assert_instance).to eq(SolidAssert::NullAssert.instance)
      end
    end

    describe "#assert" do
      it "is delegated to SolidAssert::NullAssert instance" do
        expect(SolidAssert::NullAssert.instance).to receive(:assert).with("condition", "message")
        assert "condition", "message"
      end
    end

    describe "#invariant" do
      it "is delegated to SolidAssert::NullAssert instance" do
        expect(SolidAssert::NullAssert.instance).to receive(:invariant).with("message")
        invariant("message") { "condition" }
      end
    end
  end
end
