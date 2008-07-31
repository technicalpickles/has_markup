require File.dirname(__FILE__) + '/test_helper'
require 'post'

class PostTest < Test::Unit::TestCase
  should_have_markup :content, :required => true, :syntax => :markdown, :cache => true
end
