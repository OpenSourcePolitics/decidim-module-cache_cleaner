# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

gem "decidim"
gem "decidim-cache_cleaner", path: "."

gem "bootsnap", "~> 1.4"
gem "puma", ">= 4.3"

group :test do
  gem "rubocop-faker"
end

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri
  gem "decidim-dev"
end

group :development do
  gem "faker", "~> 2.14"
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 4.0"
end
