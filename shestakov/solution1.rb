require_relative '../erb_compiler'

module Solution1
	module CommentHelper
		PARSER = %r{
			\[ quote \s* =? \s* (?<author>\w+)? \s* \]
			\s* (?<citation>.+?) \s*
			\[ /quote \]
		}xm

		def format_comment comment
			comment.gsub(PARSER) { "<div class='quotecontent'>#{$~[:author] ? "<div class='quotestart'><div class='quotename'>Citata &mdash; #{$~[:author]}</div>" : ""}#{$~[:citation]}</div>" }
		end
	end

	def self.solve comment
		compiler = ErbCompiler.new(File.read 'shestakov/solution1.html.erb')
		compiler.extend CommentHelper

		compiler.compile comment
	end
end