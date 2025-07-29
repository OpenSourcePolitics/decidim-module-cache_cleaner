# frozen_string_literal: true

# :nocov:
module Decidim
  # This holds the decidim-meetings version.
  module CacheCleaner
    # Returns the version of the current build.
    def self.version
      "1.1"
    end

    # Returns the version of Decidim this module is compatible with.
    def self.decidim_compatible_version
      "~> 0.29.0"
    end
  end
end
# :nocov:
