# frozen_string_literal: true

require "decidim/cache_cleaner/admin"
require "decidim/cache_cleaner/engine"
require "decidim/cache_cleaner/admin_engine"

module Decidim
  # This namespace holds the logic of the `CacheCleaner` component. This component
  # allows users to create cache_cleaner in a participatory space.
  module CacheCleaner
    autoload :CacheManager, "decidim/cache_cleaner/cache_manager"
  end
end
