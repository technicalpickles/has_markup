module HasMarkup  
  # Modules to extend ActiveRecord
  module ActiveRecord # :nodoc:
    # Methods that are added to ActiveRecord::Base
    module ClassMethods
      def has_markup(attr, options = {})
        extend HasMarkup::ClassMethods
        include HasMarkup::InstanceMethods

        options = default_has_markup_options.merge(options)

        if options[:required]
          validates_presence_of attr
        end

        case syntax = options[:syntax]
        when :markdown
          validates_markdown_syntax attr
        else
          raise "Unsupported syntax #{syntax.inspect}. has_markup currently supports :markdown"
        end

        if options[:cache]
          define_method "cache_#{attr}" do
            cache_markup_of attr, options[:syntax]
          end
          before_save "cache_#{attr}".to_sym
        end
      end

      def validates_markdown_syntax(*attrs)
        validates_each(*attrs) do |record, attr, value|
          begin
            BlueCloth.new(value).to_html unless value.nil?
          rescue BlueCloth::FormatError => e
            errors.add attr, "has #{e}" 
          end
        end
      end

      def default_has_markup_options
        {
          :syntax => :markdown,
          :required => false,
          :cache => false
        }
      end
    end
    
    # Methods that are added to ActiveRecord::Base (none yet)
    module InstanceMethods
      
    end
    
  end
  
  # Methods which are added to instances of classes which have been has_markupified.
  module InstanceMethods
    def cache_markup_of(attr, syntax)
      case syntax
      when :markdown
        html = BlueCloth.new(self.send(attr)).to_html
        self.send("cached_#{attr}=", html)
      else
        raise "Unsupported syntax #{syntax.inspect}. has_markup supports: :markdown"
      end
    end
  end
  
  # Methods which are added to classes which have been has_markupified.
  module ClassMethods
  end
end

require 'active_record'


module ActiveRecord # :nodoc:all
  class Base
    extend HasMarkup::ActiveRecord::ClassMethods
    include HasMarkup::ActiveRecord::InstanceMethods
  end
end
