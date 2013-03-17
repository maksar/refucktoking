require_relative '../erb_compiler'

module Solution2

	class Comment
		PARSER = %r{
			\[ quote \s* =? \s* (?<author>\w+)? \s* \]
			\s* (?<citation>.+?) \s*
			\[ /quote \]
		}xm

		def initialize raw_body
			@match = PARSER.match raw_body
		end

		def author
			@match[:author]
		end


		def body
			@match[:citation]
		end
	end

	def self.solve comment
		compiler = ErbCompiler.new(File.read 'shestakov/solution2.html.erb')

		compiler.compile Comment.new comment
	end
end