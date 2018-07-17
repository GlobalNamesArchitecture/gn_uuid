# frozen_string_literal: true

describe GnUUID do
  describe ".version" do
    it "returns version" do
      expect(subject::VERSION).to match(/^\d+\.\d+\.\d+$/)
      expect(subject.version).to eq subject::VERSION
    end
  end

  describe ".uuid" do
    let(:str) { "Homo sapiens" }
    it "returns string representation of UUID" do
      expect(subject.uuid(str)).to eq "16f235a0-e4a3-529c-9b83-bd15fe722110"
    end

    context "object representation" do
      it "returns GnUUID::UUID object" do
        expect(subject.uuid(str, false)).to be_kind_of GnUUID::UUID
      end
    end
  end

  describe ".parse" do
    let(:guid) { "16f235a0-e4a3-529c-9b83-bd15fe722110" }
    it "takes a UUID string and returns GnUUID::UUID object" do
      expect(subject.parse(guid)).to be_kind_of GnUUID::UUID
      expect(subject.parse(guid).to_s).to eq guid
    end
  end
end
