# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.4'

gem 'bcrypt'
gem 'bootsnap', require: false
gem 'font-awesome-sass'
gem 'importmap-rails'
gem 'jbuilder'
gem 'omniauth'
gem 'omniauth-github'
gem 'omniauth-rails_csrf_protection'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.8'
gem 'rails-i18n'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'tailwindcss-rails', '~> 2.7'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'erb_lint', require: false
  gem 'htmlbeautifier'
  gem 'pry-rails'
  gem 'rubocop-fjord', require: false
  gem 'rubocop-rails', require: false
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
