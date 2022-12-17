# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4'
# Use postgres as the database for Active Record
gem 'pg'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'
# Use custom serializer
gem 'active_model_serializers', '~> 0.10.0'
# Xml toolkit for import OpenSongs formatted files
gem 'rexml', '~> 3.2', '>= 3.2.4'
# Friendly id
gem 'friendly_id', '~> 5.4.0'
# Map quary params
gem 'has_scope'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
# Pagination
gem 'pagy', '~> 5.10'
# CSV parser
gem 'smarter_csv', '~> 1.1', '>= 1.1.4'

group :development do
  # Linting
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
end

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end
