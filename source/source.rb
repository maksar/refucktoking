require 'ostruct'
require_relative '../erb_compiler'

module Source
  def self.solve comment
    compiler = ErbCompiler.new(File.read File.join(File.dirname(__FILE__), 'source.html.erb'))

    compiler.compile comment
  end
end