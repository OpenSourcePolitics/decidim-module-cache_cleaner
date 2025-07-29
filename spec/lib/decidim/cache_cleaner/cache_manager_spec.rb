# frozen_string_literal: true

require "spec_helper"
require "digest"

describe Decidim::CacheCleaner::CacheManager do
  subject(:cache_manager) { described_class.new }

  describe "#activated?" do
    it "returns false if cache is not activated" do
      expect(cache_manager.activated?).to be(false)
    end

    it "returns true if cache is activated" do
      allow(Rails.cache).to receive_messages(write: true, read: Digest::SHA1.hexdigest("cache_test_value"))
      expect(cache_manager.activated?).to be(true)
    end
  end

  describe "#clearable?" do
    it "returns true if cache is clearable" do
      expect(cache_manager.clearable?).to be(true)
    end

    it "returns false if cache is not clearable" do
      allow(Rails.cache).to receive(:respond_to?).with(:clear).and_return(false)
      expect(cache_manager.clearable?).to be(false)
    end
  end

  describe "#clear!" do
    before do
      allow(Rails.cache).to receive_messages(write: true, read: "test_value")
    end

    it "clears the cache" do
      before = Rails.cache.write("test_cache_test_key", "test_value")
      expect(cache_manager.clear!).to be(true)
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
