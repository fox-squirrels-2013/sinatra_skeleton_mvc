# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'
require 'twitter'
require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'twitter'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

configure do
  # By default, Sinatra assumes that the root is the file that calls the configure block.
  # Since this is not the case for us, we set it manually.
  set :root, APP_ROOT.to_path
  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  # Set the views to
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')



#Twitter configuration
Twitter.configure do |config|
  config.consumer_key = '1CweqPwP2qGswJ8mGgGmYQ'
  config.consumer_secret = 'IMMXkv0mPYfNnsGbwUaCM5M28OG0cD0HYU6ZvuWzv80'
  config.oauth_token = '2190741499-SS4PemM6jSJ5rsOn2PveNizNglhkC7Rt2t19uVu'
  config.oauth_token_secret = 'OFVS2RiK5wrjd8xmJ73akCoiXsggiv012ewh6YObPkEVm'
end
