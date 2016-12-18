require "./md2html/*"
require "markdown"

module Md2html
  class Md
    def initialize(@io : IO?)
    end

    def to_html(text : String?)
      io = @io
      return unless io
      return unless text
      io.puts Markdown.to_html(text)
    end
  end
end
