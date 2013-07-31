ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'rake'
require 'shotgun'

require 'erb'
require 'bcrypt'
require 'oauth'
require 'twitter'
require 'sidekiq'
require 'redis'
require 'sidekiq/extensions/active_record'

# Styling
require 'sass'
require 'sass/plugin/rack'
require 'bourbon'
require 'neat'

# Testing
if development?
  require 'faker'
  require 'pry' 
  require 'debugger'
end


# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

set :root, APP_ROOT

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')

# Twitter
Twitter.configure do |config|
  config.consumer_key = ENV["TWITTER_KEY"]
  config.consumer_secret = ENV["TWITTER_SECRET"]  
end
