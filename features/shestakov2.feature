Feature: Solution2 check

  Background:
    Given using "ShestakovSolution2"

  Scenario: simple quote
    Given quote
      """
      before[quote]citation[/quote]after
      """
    Then I should see
      """
      <div class="comment-content">
        before        <p>citation</p>
        after
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
        before        <p>citation</p>
        after
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
        before          <div class="quotestart">
              <div class="quotename">
                Цитата &mdash; maksar
              </div>
            </div>
              <p>citation</p>
        after
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
        before          <div class="quotestart">
              <div class="quotename">
                Цитата &mdash; maksar
              </div>
            </div>
              <p>citation</p>
        after
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
        before          <div class="quotestart">
              <div class="quotename">
                Цитата &mdash; maksar
              </div>
            </div>
              <p>citation</p>
        after
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
        before          <div class="quotestart">
              <div class="quotename">
                Цитата &mdash; maksar
              </div>
            </div>
              <p>citation</p>
        after before          <div class="quotestart">
              <div class="quotename">
                Цитата &mdash; author
              </div>
            </div>
              <p>citation</p>
        after
      </div>
      """