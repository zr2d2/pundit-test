source 'https://rubygems.org'

ruby '2.0.0'

gem 'foundation-rails'
gem 'coffee-rails'
gem 'delayed_job_active_record', '>= 4.0.0'
gem 'email_validator'
gem 'flutie'
gem 'high_voltage'
gem 'jquery-rails'
gem 'pg'
gem 'rack-timeout'
gem 'rails', '>= 4.0.0'
gem 'recipient_interceptor'
gem 'sass-rails'
gem 'simple_form'
gem 'uglifier'
gem 'unicorn'
gem 'haml'
gem 'omniauth-saml' # for SAML login
gem 'draper', '~> 1.3'

gem 'pundit'
gem 'assignable_values'

gem 'memcachier'
gem 'dalli' # for memcached
gem 'exception_notification' # for better notifications

group :development do
  gem 'pry-rails' # better then standard IRB
  gem 'heroku_san'

  gem 'meta_request'
  gem 'letter_opener'

  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'foreman'
  
  gem 'zeus', '0.13.4.pre2'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails', '>= 2.14'
  gem 'rspec'
end

group :test do
  gem 'capybara-webkit', '>= 1.0.0'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'newrelic_rpm', '>= 3.6.7'
  gem 'rails_12factor'
end
