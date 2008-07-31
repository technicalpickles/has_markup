require 'has_markup'
ActiveRecord::Base.send :include, HasMarkup

if defined? ThoughtBot::Shoulda
  require 'has_markup/shoulda'
end