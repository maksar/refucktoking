Feature: Solution1 check

  Background:
    Given using "ShestakovSolution1"

  Scenario: simple quote
    Given quote
      """
      before[quote]citation[/quote]after
      """
    Then I should see
      """
      <div class="comment-content">
        <p>before<div class="quotecontent">citation</div>after</p>
      </div>
      """

  Scenario: simple quote with spaces
    Given quote
      """
      before[ quote ]citation[ / quote ]after
      """
    Then I should see
      """
      <div class="comment-content">
        <p>before<div class="quotecontent">citation</div>after</p>
      </div>
      """

  Scenario: quote with author
    Given quote
      """
      before[quote=maksar]citation[/quote]after
      """
    Then I should see
      """
      <div class="comment-content">
        <p>before<div class="quotecontent"><div class="quotestart"><div class="quotename">Цитата &mdash; maksar</div>citation</div>after</p>
      </div>
      """

  Scenario: quote with author and spaces
    Given quote
      """
      before[ quote = maksar ]citation[ / quote ]after
      """
    Then I should see
      """
      <div class="comment-content">
        <p>before<div class="quotecontent"><div class="quotestart"><div class="quotename">Цитата &mdash; maksar</div>citation</div>after</p>
      </div>
      """

  Scenario: invalid quote with author and spaces
    Given quote
      """
      before[ quote maksar ]citation[ / quote ]after
      """
    Then I should see
      """
      <div class="comment-content">
        <p>before<div class="quotecontent"><div class="quotestart"><div class="quotename">Цитата &mdash; maksar</div>citation</div>after</p>
      </div>
      """

  Scenario: two quotes in one comment
    Given quote
      """
      before[ quote = maksar ]citation[ / quote ]after before[quote=author]citation[/quote]after
      """
    Then I should see
      """
      <div class="comment-content">
        <p>before<div class="quotecontent"><div class="quotestart"><div class="quotename">Цитата &mdash; maksar</div>citation</div>after before<div class="quotecontent"><div class="quotestart"><div class="quotename">Цитата &mdash; author</div>citation</div>after</p>
      </div>
      """