source "https://rubygems.org"

gem "rails", "~> 7.1.5"
gem "sprockets-rails"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "bcrypt"

group :development, :test do
  gem "sqlite3", "~> 2.1"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :production do
  gem "pg"
end