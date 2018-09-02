module ActiveAttr
  module Additions
    extend ActiveSupport::Concern
    
    module ClassMethods

      def nested_attribute name, options={}
        is_plural = name.to_s.pluralize == name.to_s
        attribute name, default: is_plural ? [] : nil

        method = options[:method_struct] || :to_struct
        define_attr = lambda do |obj|
            obj.send(method) if obj.respond_to?(method)
        end

        define_method :"#{name}=" do |attributes|
          if is_plural
            attributes.each do |obj|
              inst = define_attr.call( obj )
              self.send(name) << inst
            end
          else
            inst = define_attr.call( attributes )
            super(inst)
          end
        end
      end

    end

  end
end