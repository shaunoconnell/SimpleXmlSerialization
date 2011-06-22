$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'simple_serialization'
require 'rexml/xpath'
require 'rexml/document'

class Widget
  include SimpleSerialization::BasicXmlSerialization
  attr_accessor :name, :type, :description
end

describe Widget do

  it "should figure out default serializable_attributes" do
    widget = Widget.new
    widget.name = "wingding"
    widget.type = "font"

    widget.serializable_attributes.size.should == 2
    widget.serializable_attributes['type'].should == "font"
    widget.serializable_attributes['name'].should == "wingding"
    widget.serializable_attributes['description'].should be_nil
  end

  it "should correctly construct the xml" do
    widget = Widget.new
    widget.name = "wingding"
    widget.type = "font"

    xml_doc = REXML::Document.new widget.to_xml
    element = REXML::XPath.first(xml_doc, "/widget/name")
    element.text.should == "wingding"
    element = REXML::XPath.first(xml_doc, "/widget/type")
    element.text.should == "font"
  end
end

