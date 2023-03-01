# frozen_string_literal: true

module Decidim
  module CacheCleaner
    # This is the engine that runs on the public interface of `CacheCleaner`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::CacheCleaner::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        post "/clear_cache", to: "cache_manager#clear", as: :clear_cache
        root to: "cache_manager#index"
      end

      def load_seed
        nil
      end

      initializer "decidim_cache_cleaner.admin_mount_routes" do
        Decidim::Core::Engine.routes do
          mount Decidim::CacheCleaner::AdminEngine, at: "/admin/cache_cleaner", as: "decidim_admin_cache_cleaner"
        end
      end

      initializer "decidim_cache_cleaner.admin_menu" do
        Decidim.menu :admin_menu do |menu|
          menu.add_item(
            :cache_cleaner,
            I18n.t("menu.cache_cleaner", scope: "decidim.cache_cleaner"),
            decidim_admin_cache_cleaner.root_path,
            icon_name: "book",
            position: 10,
            active: :inclusive,
            if: allowed_to?(:update, :organization, organization: current_organization)
          )
        end
      end
    end
  end
end
