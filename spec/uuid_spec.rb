# frozen_string_literal: true

describe GnUUID::UUID do
  let(:bytes) do
    "\x47\xd6\x1c\x81\x5a\x0f\x54\x48\x96\x4a\x34\xbb\xfb\x54\xce\x8b"
  end
  let(:guid) { "47d61c81-5a0f-5448-964a-34bbfb54ce8b" }
  subject { GnUUID::UUID.new(bytes) }

  describe ".new" do
    it "takes 16-byte string and creates an instance" do
      expect(subject).to be_kind_of GnUUID::UUID
    end
  end

  describe "#bytes" do
    it "returns byte string" do
      expect(subject.bytes).to eq bytes
    end
  end

  describe "#to_s" do
    it "returns guid version of UUID" do
      expect(subject.to_s).to eq guid
    end
  end

  describe "#to_i" do
    it "returns integer version UUID" do
      expect(subject.to_i.to_s(16)).to eq "47d61c815a0f5448964a34bbfb54ce8b"
    end
  end

  describe "#to_uri" do
    it "returns urn" do
      expect(subject.to_uri).to eq "urn:uuid:#{guid}"
    end
  end

  describe "#version" do
    it "returns version" do
      expect(subject.version).to eq 5
    end
  end
end
