require_relative '../erb_compiler'

module Solution2
  module CommentsHelper
    PARSER = %r{
      \[ \s* quote \s* =? \s* (?<author>\w+)? \s* \]
      \s* (?<citation>.+?) \s*
      \[ \s* / \s* quote \s* \]
    }xm

    class Comment < Struct.new :author, :body
    end

    def render_comment comment, &block
      buffer = @output ; @output = ""
      buffer << comment.gsub(PARSER) {
        block.call(@quote = Comment.new($~[:author], $~[:citation])).tap { @output = "" }
      }
      @output = buffer
    end

    def quote
      @quote
    end
  end


	def self.solve comment
		compiler = ErbCompiler.new(File.read File.join(File.dirname(__FILE__), 'solution2.html.erb'))
    compiler.extend CommentsHelper

    compiler.compile comment
	end

end