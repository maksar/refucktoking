require 'erb'
require 'action_view'

class ErbCompiler
	include ActionView::Helpers::OutputSafetyHelper
	include ActionView::Helpers::TextHelper

	attr_reader :comment, :output

  attr_accessor :output_buffer

	def initialize contents
		@erb = ERB.new contents, nil, '%<>-', '@output'
    @output_buffer = ActionView::OutputBuffer.new
	end

	def compile comment
		@comment = comment

		@erb.result binding

		@output
	end
end