source 'https://rubygems.org'
                          
gem 'rails', '~> 3.1.12'
gem 'sqlite3'
gem 'redis',                          '~> 2.2',  require: %w[
                                                   redis/connection/hiredis
                                                   redis]
gem 'hiredis',                        '~> 0.4'
gem 'pg'
gem 'haml'
gem 'bcrypt-ruby',                    '~> 3.0',  require: 'bcrypt'
#gem 'actionpack', '~> 3.2.1'
#gem 'redis-rails', '~> 3.2.1'
gem 'resque',                         '~> 1.22.0' # if updating beyond 1.22, ensure Resque::Failure#all still works
gem 'resque-loner',                   '~> 1.2'
gem 'resque-pool',                    '~> 0.3'
gem 'authlogic',                      '~> 3.1'
gem 'rails_legacy_mapper'
gem 'jquery-rails'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer', '0.12.0'
end

group :development, :test do
	gem "debugger", require: false
  gem 'rb-fsevent', '~> 0.9.0', :require => false
  gem 'rb-inotify', :require => false
  gem 'rb-fchange', :require => false
  gem 'minitest-rails-capybara', '~> 0.1.0'
  gem 'minitest-rails', '~> 0.5.0'
	gem 'guard'
  gem 'guard-bundler'
  gem 'guard-minitest', '~> 0.5.0'
  gem 'factory_girl_rails', '~> 4.3.0'
  gem 'rspec-rails', '~> 2.12.0'
end

group :development do

end

group :test do
  gem 'poltergeist', '~> 1.5.0'
end
