source 'https://rubygems.org'

ruby '2.2.1'

gem 'rails', '4.2.0'
gem 'mysql2'

gem 'sass-rails', '~> 5.0'
gem 'foundation-rails'
gem 'foundation-icons-sass-rails'
gem 'uglifier', '>= 1.3.0'

gem 'haml-rails'
gem 'jquery-rails'

gem 'devise'
gem 'devise-i18n'
gem "omniauth-google-oauth2"

gem 'paperclip', '~> 4.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :development do
  gem 'quiet_assets'
  gem 'thin'
end

group :test do
  gem 'factory_girl_rails'
  gem 'simplecov', require: false
  gem 'database_cleaner'
  gem 'rspec-rails'
end