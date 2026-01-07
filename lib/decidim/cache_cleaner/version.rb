# frozen_string_literal: true

# :nocov:
module Decidim
  # This holds the decidim-meetings version.
  module CacheCleaner
    # Returns the version of the current build.
    def self.version
      "1.2.0"
    end

    # Returns the version of Decidim this module is compatible with.
    def self.decidim_compatible_version
      "~> 0.31.0"
    end
  end
end
# :nocov:
