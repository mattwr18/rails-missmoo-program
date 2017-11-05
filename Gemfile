source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 3.0'
gem 'bcrypt', '~> 3.1.7'
gem 'capistrano-rails', group: :development
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.6', '>= 3.6.1'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.8'
  gem 'pry'
  gem 'pry-rails'
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'guard-bundler'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise', '~> 4.3'
gem 'pundit', '~> 1.1'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'shoulda-matchers', group: :test
gem 'cocoon', '~> 1.2', '>= 1.2.11'
