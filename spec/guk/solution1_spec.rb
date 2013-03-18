#coding: utf-8
require_relative '../spec_helper'
require_relative '../../guk/solution1'

describe GukSolution1 do
  it 'correctly parses comment' do
    GukSolution1.solve(OpenStruct.new body: "before [quote=maksar ] citation [/quote] after").must_equal <<-HTML.strip
<div class="comment-content">
  <p><p>before <div class="quotestart"><div class="quotename">Цитата - maksar</div> <div class="quotecontent"> citation </div></div> after</p></p>
</div>
HTML
  end
end