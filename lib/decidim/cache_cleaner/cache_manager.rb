# frozen_string_literal: true

require "digest"

module Decidim
  module CacheCleaner
    class CacheManager
      TEST_KEY = ::Digest::SHA1.hexdigest("cache_test_key")
      TEST_VALUE = ::Digest::SHA1.hexdigest("cache_test_value")

      def initialize
        @cache = Rails.cache
      end

      def activated?
        @cache.write(TEST_KEY, TEST_VALUE)
        yield if block_given?
        @cache.read(TEST_KEY) == TEST_VALUE
      end

      alias ensure_clearness activated?

      def clearable?
        @cache.respond_to?(:clear)
      end

      def clear!
        return unless clearable?

        !ensure_clearness do
          @cache.clear
        end
      end

      def cache_store
        @cache.class.name
      end
    end
  end
end
