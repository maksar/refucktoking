#coding: utf-8
require_relative '../erb_compiler'

module GukSolution1
  module CommentsHelper
    QUOTE_START = "<div class=quotestart><div class=quotename>Цитата - %s</div>"
    SKIP_LIST = [
      '</p>',
      '<p>'
    ]

    def prepare_comment(comment)
      return comment.body unless comment.body.include?('[/quote]')
      
      results = []
      name_check = false    # Partially keeps value between cycles. Needs investigation
      content_check = false # The same
      processing_quote = false # Keeps value between cycles, Needs investigation

      simple_format(comment.body).split(' ').each do |word|
        result = word

        if result.include?('[/quote]')
          content_check = false
          name_check = false
          result = result.gsub('[/quote]', '</div></div>')
          processing_quote = false # New
        elsif result.include?('[quote=') # Seems like should be in own if, i.e. quote can start with closing prev?
          name_check = true
          processing_quote = true
          result = result.gsub('[quote=', '')
        elsif result.include?(']')
          result = result.gsub(']', '')
        end

        if processing_quote && !SKIP_LIST.include?(result)
          if content_check && name_check 
            result = "<div class=quotecontent>#{ QUOTE_START % result }"
            content_check = true # Seems like should be false
            name_check = false
          elsif content_check
            result = '<div class=quotecontent>' + result
            content_check = false
          elsif name_check
            result = QUOTE_START % result
            name_check = false
            content_check = true
          end
        end

        results << result
      end

      results.join(' ')
    end
  end

  def self.solve comment
    compiler = ErbCompiler.new(File.read File.join(File.dirname(__FILE__), 'solution1.html.erb'))
    compiler.extend CommentsHelper

    compiler.compile comment
  end
end