source "https://rubygems.org"

ruby "3.3.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3"
gem "sprockets-rails", ">= 3.4.1"
gem "puma", "~> 6.0"
gem "turbo-rails", "~> 2.0.0"
gem "stimulus-rails", "~> 1.0", ">= 1.0.2"
gem "jbuilder", github: "excid3/jbuilder", branch: "partial-paths" # "~> 2.11"
gem "cssbundling-rails"

gem 'devise'
gem 'pagy'
gem 'countries', require: 'countries/global'

# Use postgresql as the database for Active Record
# DB
gem "pg"
gem 'marginalia'
gem 'pg_query'
gem 'pg_search', '~> 2.3'
gem 'pgslice'
gem 'scenic'


# Permissions

gem 'cancancan'


# Caching
gem "redis", "~> 5.0"
gem "kredis"

gem "tzinfo-data"
gem "bootsnap", ">= 1.4.2", require: false
gem "image_processing", "~> 1.12"
gem "nokogiri", ">= 1.12.5"
# dev tools

gem "hamlit"
gem "kramdown"
gem "escape_utils"

# Frontend Helpers

gem 'chart-js-rails'                      # https://github.com/coderbydesign/chart-js-rails
gem 'chartkick'
gem 'popper_js'                           # https://github.com/glebm/popper_js-rubygem
gem 'view_component', '~> 3.6'            # https://viewcomponent.org/


group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "web-console", ">= 4.1.0"
  gem "pry-rails"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Lint code for consistent style
  gem "standard", require: false
  gem "erb_lint", require: false
  gem 'benchmark-ips', require: false
  gem 'amazing_print'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'prosopite'
  gem 'colorize'

  gem "letter_opener_web", "~> 2.0"
end

group :development do
  gem "annotate", ">= 3.2.0"

  gem 'better_errors'
  gem 'activerecord-explain-analyze'
  gem 'active_record_query_trace'
  gem 'binding_of_caller'

  # Enhanced Exception messages
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]

  # A fully configurable and extendable Git hook manager
  gem "overcommit", require: false

  # Adds Rails support to your editor
  gem "ruby-lsp-rails"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end
