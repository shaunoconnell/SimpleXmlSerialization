
require 'rexml/document'
require 'rexml/element'

module SimpleSerialization
    module BasicXmlSerialization
      def to_xml(options={})
        xml_doc = REXML::Document.new
        root_element = xml_doc.add_element self.class.to_s.downcase
        serializable_attributes.each do |name, value|
          attr_element = root_element.add_element name
          attr_element.text = value
        end

        unless options[:builder].nil?
          options[:builder].text! xml_doc.to_s
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
