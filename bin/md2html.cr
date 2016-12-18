require "../src/md2html"
require "option_parser"

OptionParser.parse! do |parser|
  parser.banner = "Usage: md2html [OPTIONS] FILE"
  parser.on("-v", "--version", "print version") { puts Md2html::VERSION }
  parser.on("-h", "--help", "print this help") { puts parser }
end

md = Md2html::Md.new(STDOUT)

if !STDIN.tty?
  md.to_html STDIN.gets_to_end
  exit 0
end

if ARGV.empty?
  exit 1
end

filename = ARGV.first
if !File.exists?(filename)
  puts "No such file: " + filename
  exit 1
end
md.to_html File.read(filename)

