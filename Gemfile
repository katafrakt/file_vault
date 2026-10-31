# frozen_string_literal: true
source "https://gem.coop"

gem "hanami", github: "hanami/hanami"
gem "dry-system", github: "dry-rb/dry-system"
gem "hanami-cli", github: "hanami/hanami-cli"
gem "dry-cli", github: "dry-rb/dry-cli"
gem "hanami-assets", github: "hanami/hanami-assets"
gem "hanami-action", github: "hanami/hanami-action"
gem "hanami-db", github: "hanami/hanami-db"
gem "hanami-mailer", github: "hanami/hanami-mailer"
gem "hanami-router", github: "hanami/hanami-router"
gem "hanami-view", github: "hanami/hanami-view"

gem "dry-types", "~> 1.7"
gem "dry-operation", ">= 1.0.1"
gem "dry-validation", "~> 1.11"
gem "i18n", "~> 1.14"
gem "puma", ">= 7.1"
gem "rake"
gem "jdbc-sqlite3"

gem "shrine", "~> 3.6"
gem "marcel"

# released version does not support JRuby 10.1 (?)
#gem 'jbundler', github: "chadlwilson/jbundler", branch: "jruby-10.1"
#gem "jar-dependencies", platform: :jruby

group :development do
  gem "hanami-webconsole", github: "hanami/hanami-webconsole"
end

group :development, :test do
  gem "dotenv"
  # Syntax highlighting SQL logs
  gem "rouge"
end

group :cli, :development do
  gem "hanami-reloader", github: "hanami/hanami-reloader"
end

group :cli, :development, :test do
  gem "hanami-rspec", github: "hanami/hanami-rspec"
end

group :test do
  # Database
  gem "database_cleaner-sequel"

  # Web integration
  gem "capybara"
  gem "rack-test"
end
