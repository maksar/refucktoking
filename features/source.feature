Feature: Source check

  Background:
    Given using "Source"

  Scenario: simple quote
    Given quote body
      """
      before [quote=maksar ] citation [/quote] after
      """
    Then I should see
      """
      <div class="comment-content">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <p><p>before <div class="quotestart"><div class="quotename">Цитата - maksar</div>  <div class="quotecontent">citation </div></div> after</p> </p>
      </div>
      """