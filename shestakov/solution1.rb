#coding: utf-8
require_relative '../erb_compiler'

module ShestakovSolution1
	module CommentsHelper
		PARSER = %r{
			\[ \s* quote \s* =? \s* (?<author>\w+)? \s* \]
			\s* (?<citation>.+?) \s*
			\[ \s* / \s* quote \s* \]
		}xm

		def format_comment comment
			comment.gsub(PARSER) { "<div class='quotecontent'>#{$~[:author] ? "<div class='quotestart'><div class='quotename'>Цитата &mdash; #{$~[:author]}</div>" : ""}#{$~[:citation]}</div>" }
		end
	end

	def self.solve comment
		compiler = ErbCompiler.new(File.read File.join(File.dirname(__FILE__), 'solution1.html.erb'))
		compiler.extend CommentsHelper

		compiler.compile comment
	end
end