require 'rails_helper'

RSpec.describe ContactImporter, type: :model do
  context "#normalize_phone" do

    it "returns nil if phone length is zero" do
      c = ContactImporter.normalize_phone

      expect(c).to eq(nil)
    end

    it "return the num if length is < 10" do
      c = ContactImporter.normalize_phone "abcd1234567"

      expect(c).to eq("1234567")
    end

    it "return the num formatted if length == 10" do
      c = ContactImporter.normalize_phone "1234567890"

      expect(c).to eq("123.456.7890")
    end

    it "return the num when 1-207-643-1816 is passed" do
      c = ContactImporter.normalize_phone "1-207-643-1816"

      expect(c).to eq("1.207.643.1816")
    end

    it "return the num when (724)196-9470 x998 is passed" do
      c = ContactImporter.normalize_phone "(724)196-9470 x998"

      expect(c).to eq("724.196.9470 x998")
    end

    it "return the num when 081-799-3139 x248 is passed" do
      c = ContactImporter.normalize_phone "081-799-3139 x248"

      expect(c).to eq("081.799.3139 x248")
    end

    it "return the num when 059.434.8303 is passed" do
      c = ContactImporter.normalize_phone " 059.434.8303"

      expect(c).to eq("059.434.8303")
    end
  end
end
