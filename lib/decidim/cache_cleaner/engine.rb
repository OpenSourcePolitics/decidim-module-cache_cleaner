# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module CacheCleaner
    # This is the engine that runs on the public interface of cache_cleaner.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::CacheCleaner

      routes do
        # Add engine routes here
        # resources :cache_cleaner
        # root to: "cache_cleaner#index"
      end

      initializer "CacheCleaner.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end
    end
  end
end
