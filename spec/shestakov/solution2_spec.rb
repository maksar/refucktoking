#coding: utf-8
require_relative '../spec_helper'
require_relative '../../shestakov/solution2'

describe ShestakovSolution2 do
  it 'correctly parses comment' do
    ShestakovSolution2.solve("before[quote=maksar]citation[/quote]after").must_equal <<-HTML.strip
<div class="comment-content">
  before          <div class="quotestart">
        <div class="quotename">
          Цитата &mdash; maksar
        </div>
      </div>
        <p>citation</p>
  after
</div>
HTML
  end
end