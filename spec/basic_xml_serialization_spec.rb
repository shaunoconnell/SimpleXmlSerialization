$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'simple_serialization'

class Widget
  include SimpleSerialization::BasicXmlSerializatoin
  attr_accessor :name, :type
end

describe Widget do

  it "should figure out default serializable_attributes"

  it "should correctly construct the xml"
end

