# frozen_string_literal: true

And(/^I go to My Page$/) do
  @my_page = MyPage.new
  @my_page.menu.my_page_link.click
end

Then(/^I see that new user doesn't have assigned and reported issues$/) do
  expect(@my_page.title.text).to include 'My page'
  expect(@my_page.current_url).to include('my/page')
  expect(@my_page.assigned_issues.text).to include('0')
  expect(@my_page.reported_issues.text).to include('0')
end
