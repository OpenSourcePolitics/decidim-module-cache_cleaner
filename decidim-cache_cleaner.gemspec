# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/cache_cleaner/version"

Gem::Specification.new do |s|
  s.version = Decidim::CacheCleaner.version
  s.authors = ["armandfardeau"]
  s.email = ["fardeauarmand@gmail.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/OpenSourcePolitics/decidim-module-cache_cleaner"
  s.required_ruby_version = ">= 2.7"

  s.name = "decidim-cache_cleaner"
  s.summary = "A decidim cache_cleaner module"
  s.description = "A decidim cache cleaner module"

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", "~> #{Decidim::CacheCleaner.decidim_compatible_version}"
  s.add_development_dependency "rubocop-faker"
end
