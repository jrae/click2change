source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1'

ruby '2.4.2'

gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

gem 'geff', git: 'https://github.com/wearefuturegov/geff.git'

gem 'gmail'
gem 'haml-rails'
gem 'jbuilder'
gem 'angularjs-rails'
gem 'rails-api'

gem 'whenever', :require => false
gem 'httparty', :require => false

gem 'rack-timeout'
gem "non-stupid-digest-assets"
gem 'responders', '~> 2.0'

gem 'bullet'

group :development, :test do
  gem 'byebug'
  gem 'highline'
  gem 'dotenv-rails'
end

group :test do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rspec-rails'
  gem 'cucumber'
  gem 'cucumber-rails'
  gem "capybara"
  gem 'poltergeist'
  gem 'email_spec'
  gem 'database_cleaner'
  gem 'webmock'
  gem 'vcr'
  gem 'simplecov', :require => false
end

group :production do
  gem 'puma'
  gem 'rails_12factor'
end
