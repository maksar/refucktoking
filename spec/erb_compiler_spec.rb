require_relative 'spec_helper'
require_relative '../erb_compiler'

describe ErbCompiler do
	it 'compiles simple erb template' do
		ErbCompiler.new("compiled").compile(nil).must_equal "compiled"
	end

	it 'compiles complex erb template' do
		ErbCompiler.new("<%= 2+2 %>").compile(nil).must_equal "4"
	end

	it 'have access to provided comment object' do
		ErbCompiler.new("<%= comment %>").compile('body').must_equal "body"
	end
end