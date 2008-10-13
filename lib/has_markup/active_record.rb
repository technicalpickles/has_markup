module HasMarkup
  # Modules to extend ActiveRecord
  module ActiveRecord
    # Methods that are added to ActiveRecord::Base
    module ClassMethods
      # Adds the following methods for dealing with markup, using <tt>has_markup :content</tt> as an example:
      # * <tt>content_html</tt> for generating the html of <tt>:content</tt>.
      # 
      # Options are:
      # * <tt>:required</tt> - column is required
      # * <tt>:syntax</tt> - syntax of the markup. Currently supports only :markdown, which is the default.
      # * <tt>:cache_html</tt> - html generated from the markup should be cached in a column. Following the
      #   example of using <tt>:content</tt>, it would require a column named <tt>:cached_content_html</tt>.
      #   It also adds a before_save hook <tt>:cache_content_html</tt> for generating the html before saving.
      #
      # To support other syntaxes, you just need to add a method on ActiveRecord::Base named like
      # <tt>sprinkle_ursyntax_magic</tt> which takes a column (where <tt>ursyntax</tt> is the name
      # of your awesome syntax). You should define a method named
      # "#{column}_html" which generates the html from the markup. You might also want to validate
      # the syntax of the column.
      def has_markup(column, options = {})
        options = HasMarkup::default_has_markup_options.merge(options)
        
        validates_presence_of column if options[:required]

        syntax = options[:syntax]
        if supported? syntax
          extend markup_syntax_module(syntax)
          send("sprinkle_#{syntax}_magic", column)
        else
          raise "Unsupported syntax #{syntax.inspect}."
        end
        sprinkle_html_caching_magic column if options[:cache_html]
      end
      
      # Is the given syntax supported?
      def supported?(syntax)
        begin
          markup_syntax_module(syntax)
          return true
        rescue NameError
          return false
        end
      end
      
      def markup_syntax_module(syntax)
        "HasMarkup::#{syntax.to_s.camelize}".constantize
      end

      
      # Sprinkles the magic for caching the html of the given
      def sprinkle_html_caching_magic(column)
        define_method "set_cached_#{column}_html" do
          html = self.send("#{column}_html")
          self.send("cached_#{column}_html=", html)
        end
        before_save "set_cached_#{column}_html".to_sym
      end
    end    
  end
  
  def self.default_has_markup_options
    {
      :syntax => :markdown,
      :required => false,
      :cache_html => false
    }
  end
end

require 'active_record'
ActiveRecord::Base.class_eval do
  extend HasMarkup::ActiveRecord::ClassMethods
end