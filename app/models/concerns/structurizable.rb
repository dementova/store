module Structurizable
  extend ActiveSupport::Concern

  def structurize struct_name, method_name='to_struct'
    define_method method_name do
      struct = struct_name.constantize.new
      struct.attributes.each do |name, val|
        if respond_to?(name)
          value = self.method(name).call rescue nil
          # value = read_attribute(name) if value.blank?
        else
          value = read_attribute(name) rescue nil
        end
        # value ||= val unless value.is_a?(Boolean)
        struct.send "#{name}=", value
      end
      struct
    end
  end

end