require 'erb'
require 'action_view'

class ErbCompiler
	include ActionView::Helpers::OutputSafetyHelper
	include ActionView::Helpers::TextHelper
  include ERB::Util

	attr_reader :comment, :output

	def initialize contents
		@erb = ERB.new contents, nil, '%<>-', '@output'
	end

	def compile comment
		@comment = comment

		@erb.result binding

		@output
	end
end