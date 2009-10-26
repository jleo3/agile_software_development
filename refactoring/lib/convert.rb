require 'rubygems'
require 'syntax/convertors/html'
convertor = Syntax::Convertors::HTML.for_syntax "ruby"
puts convertor.convert(File.read(ARGV[0]))
