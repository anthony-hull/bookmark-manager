
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require 'rack/test'
require './app'
require './spec/db_helper'
require 'pry-byebug'

ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'
Capybara.app = BookmarkManager

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console
                                                               ])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) { prep_test_db }
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
