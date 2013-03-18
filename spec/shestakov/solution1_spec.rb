#coding: utf-8
require_relative '../spec_helper'
require_relative '../../shestakov/solution1'

describe ShestakovSolution1 do
	it 'correctly parses comment' do
		ShestakovSolution1.solve("before[quote=maksar]citation[/quote]after").must_equal <<-HTML.strip
<div class="comment-content">
  <p>before<div class="quotecontent"><div class="quotestart"><div class="quotename">Цитата &mdash; maksar</div>citation</div>after</p>
</div>
HTML
	end
end