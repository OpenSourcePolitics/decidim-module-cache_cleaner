# frozen_string_literal: true

module Decidim
  module CacheCleaner
    module Admin
      # This controller allows admins to manage cache_cleaner in Decidim application.
      class CacheManagerController < Decidim::Admin::ApplicationController
        def index
          enforce_permission_to :update, :organization
          @cache_manager = cache_manager
        end

        def clear
          enforce_permission_to :update, :organization

          if cache_manager.clear!
            redirect_to decidim_admin_cache_cleaner.root_path, notice: t("decidim.cache_cleaner.cache_manager.clear.success")
          else
            redirect_to decidim_admin_cache_cleaner.root_path, alert: t("decidim.cache_cleaner.cache_manager.clear.error")
          end
        end

        def cache_manager
          @cache_manager ||= Decidim::CacheCleaner::CacheManager.new
        end
      end
    end
  end
end
