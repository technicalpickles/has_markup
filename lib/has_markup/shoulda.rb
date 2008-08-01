require 'shoulda'

module HasMarkup # :nodoc:
  # Shoulda macros for has_markup.
  module Shoulda
    # Ensure that markup is getting cached.
    #
    #   should_cache_markup :content
    def should_cache_markup(attr)
      should_have_db_column "cached_#{attr}_html"
      should_have_instance_methods "cache_#{attr}_html"
      # TODO test that there's before_save action happening
    end
    
    def should_require_markup(attr)
      should_require_attributes attr
    end
    
    # Ensure that the model has markup. Accepts all the same options that has_markup does.
    #
    #   should_cache_markup :content
    def should_have_markup(attr, options = {})
      options = HasMarkup::default_has_markup_options.merge(options)
      should_have_instance_methods "#{attr}_html"

      should_require_markup attr if options[:required]

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
