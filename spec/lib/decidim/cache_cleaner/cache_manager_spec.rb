# frozen_string_literal: true

require "spec_helper"
require "digest"

describe Decidim::CacheCleaner::CacheManager do
  subject(:cache_manager) { described_class.new }

  describe "#activated?" do
    it "returns false if cache is not activated" do
      expect(cache_manager.activated?).to eq(false)
    end

    it "returns true if cache is activated" do
      allow(Rails.cache).to receive(:write).and_return(true)
      allow(Rails.cache).to receive(:read).and_return(::Digest::SHA1.hexdigest("cache_test_value"))
      expect(cache_manager.activated?).to eq(true)
    end
  end

  describe "#clearable?" do
    it "returns true if cache is clearable" do
      expect(cache_manager.clearable?).to eq(true)
    end

    it "returns false if cache is not clearable" do
      allow(Rails.cache).to receive(:respond_to?).with(:clear).and_return(false)
      expect(cache_manager.clearable?).to eq(false)
    end
  end

  describe "#clear!" do
    before do
      allow(Rails.cache).to receive(:write).and_return(true)
      allow(Rails.cache).to receive(:read).and_return("test_value")
    end

    it "clears the cache" do
      before = Rails.cache.write("test_cache_test_key", "test_value")
      expect(cache_manager.clear!).to eq(true)
      after = Rails.cache.read("test_cache_test_key")
      expect(before).not_to eq(after)
    end
  end

  describe "#cache_store" do
    it "returns the cache store" do
      expect(cache_manager.cache_store).to eq(Rails.cache.class.name)
    end
  end
end
