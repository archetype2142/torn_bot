# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.1.0'

gem 'rails', '~> 7.1.3', '>= 7.1.3.2'

gem 'bootsnap', require: false
gem 'jbuilder'
gem 'puma', '>= 5.0'
gem 'redis', '>= 4.0.1'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'
gem 'sassc-rails'
gem 'bootsnap', require: false
gem 'devise'
gem 'image_processing', '~> 1.2'
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sidekiq-scheduler'
gem 'slim'

group :development, :test do
  gem 'debug', platforms: %i[mri mswin mswin64 mingw x64_mingw]
  gem 'rubocop', '~> 1.35.0'
  gem 'rubocop-performance'
  gem 'rubocop-rails', '~> 2.14.2'
  gem 'rubocop-rspec'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem 'spring'

  gem 'error_highlight', '>= 0.4.0', platforms: [:ruby]
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mswin mswin64 mingw x64_mingw jruby]
