# frozen_string_literal: true

require "simplecov"

if ENV["CODECOV"]
  SimpleCov.start "rails" do
    add_filter "spec/decidim_dummy_app"
  end
end

require "decidim/dev"

ENV["ENGINE_ROOT"] = File.dirname(__dir__)

Decidim::Dev.dummy_app_path = File.expand_path(File.join("spec", "decidim_dummy_app"))

require "decidim/dev/test/base_spec_helper"
