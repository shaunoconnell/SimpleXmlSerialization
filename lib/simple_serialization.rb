
require 'rexml/document'
require 'rexml/element'

module SimpleSerialization
    module BasicXmlSerializatoin
      def to_xml
        xml_doc = REXML::Document.new
        xml_doc << REXML::XMLDecl.new
        root_element = xml_doc.add_element self.class.to_s.downcase
        serializable_attributes.each do |name, value|
          attr_element = root_element.add_element name
          attr_element.text = value
        end
        xml_doc.to_s
      end

      def serializable_attributes
        attrs = {}
        self.instance_variables.each { |var|
          attrs[var.to_s[1..var.length]] = send(var.to_s[1..var.length])
        }
        attrs
      end

    end
end
