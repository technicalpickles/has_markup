$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

require 'rubygems'
require 'test/unit'
require 'active_record'
require 'shoulda'
require 'shoulda/asserts'
require 'shoulda/rails'
require 'factory_girl'
require 'ruby-debug'

RAILS_ROOT = File.dirname(__FILE__)
require 'logger'
RAILS_DEFAULT_LOGGER = Logger.new("#{RAILS_ROOT}/test.log") 

require File.dirname(__FILE__) + '/../init'
require File.dirname(__FILE__) + '/post.rb'

config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")
ActiveRecord::Base.establish_connection(config[ENV['DB'] || 'plugin_test'])

load(File.dirname(__FILE__) + "/schema.rb") if File.exist?(File.dirname(__FILE__) + "/schema.rb")