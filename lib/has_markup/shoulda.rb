require 'shoulda'

module HasMarkup # :nodoc:
  # Shoulda macros for has_markup.
  module Shoulda
    # Ensure that markup is getting cached.
    #
    #   should_cache_markup :content
    def should_cache_markup(attr)
      should_have_db_column "cached_#{attr}"
      should_have_instance_methods "cache_#{attr}"
      # TODO test that there's before_save action happening
    end
    
    # Ensure that the model has markup. Accepts all the same options that has_markup does.
    #
    #   should_cache_markup :content
    def should_have_markup(attr, options = {})
      should_require_attributes attr if options[:required]
    
      should_cache_markup attr if options[:cache]
    end    
  end
end

module Test # :nodoc: all
  module Unit 
    class TestCase
      extend HasMarkup::Shoulda
    end
  end
end
