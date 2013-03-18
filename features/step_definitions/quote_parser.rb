Given(/^using "(.*)"$/) do |solution|
  @solution = Object.const_get(solution)
end

Given(/^quote$/) do |quote|
  @quote = quote
end

Then(/^I should see$/) do |result|
    @solution.solve(@quote).must_equal result
end
