# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib",__FILE__)

spec = Gem::Specification.new do |s|
  s.name = 'SimpleXmlSerialization'
  s.version = '0.0.1'
  s.extra_rdoc_files = ['README', 'LICENSE']
  s.summary = 'just a mixin for to_xml with rexml'
  s.description = s.summary
  s.author = ''
  s.email = ''
  s.files = %w(LICENSE README Rakefile) + Dir.glob("{bin,lib,spec}/**/*")
  s.require_path = "lib"
  s.bindir = "bin"
end