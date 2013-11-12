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

# Marion's keys
# Twitter.configure do |config|
#   config.consumer_key = 'm8AayyyMYK7Zl6I4DXPVA'
#   config.consumer_secret = 'dr5lqaOHTyeh5jQgSP4RihTGKlq0jeEe6HIRXoqXbQ'
#   config.oauth_token = '419333254-iBmslQAACbcc193AHxgPIrLHiOXMdjq9cz9h7Iiu'
#   config.oauth_token_secret = 'W2bB2Zr8Mirhj4GxrCwviykRZ2IVkeraiBpfV7pLBpanS'
# end

Twitter.configure do |config|
  config.consumer_key = 'XBXSiefx3y6jnBaI1Cdtew'
  config.consumer_secret = 'v5kpCrSfAtrprtbzlrlRp5PPcZHNGBRk8QVoaMC0yg'
  config.oauth_token = '1370464358-DlMjrrAzCBgNGZ16lxWli1xSkjBZoCo3XzyIc2k'
  config.oauth_token_secret = '6csN7RWoCnXxUPbZ2j1OisiO6dtJKvgUHwbo2xDmVZjIx'
end

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')
