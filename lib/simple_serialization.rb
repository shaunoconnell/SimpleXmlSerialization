
module SimpleSerialization
    module BasicXmlSerializatoin
      def to_xml

      end

      def serializable_attributes
        attrs = {}
        self.instance_variables.each { |var| attrs[var.to_s[1..var.length]] = send(var.to_s[1..var.length])}
        attrs
      end
    end
end

#class Widget
#  include SimpleSerialization::BasicXmlSerializatoin
#  attr_accessor :name
#end
#
#
#w = Widget.new
#w.name = "alpha"
#
#puts w.serializable_attributes.class
