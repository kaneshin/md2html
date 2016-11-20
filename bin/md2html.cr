require "../src/md2html"
require "option_parser"

OptionParser.parse! do |parser|
  parser.banner = "Usage: md2html [OPTIONS] FILE"
  parser.on("-v", "--version", "print version") { puts Md2html::VERSION }
  parser.on("-h", "--help", "print this help") { puts parser }
end

if ARGV.empty?
  puts "missing file operand"
  exit 1
end

filename = ARGV.first
if !File.exists?(filename)
  puts "No such file: " + filename
  exit 1
end

md = Md2html::Md.new(STDOUT)
md.to_html filename
