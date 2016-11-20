require "./md2html/*"
require "markdown"

module Md2html
  class Md
    def initialize(@io : IO?)
    end

    def to_html(filename)
      io = @io
      return unless io

      io.puts Markdown.to_html(File.read(filename))
    end
  end
end
