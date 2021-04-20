# frozen_string_literal: true

Given(/^I visit Redmine homepage$/) do
  @home_page = HomePage.new
  @home_page.load
end

Given(/^I have preregistered user$/) do
  @user = User.new
  api_create_user(@user)
end

When(/^I click ([^"]*) button$/) do |button|
  button == 'login' ? @home_page.menu.sigh_in_link.click : @home_page.menu.sigh_up_link.click
end

When(/^I fill in login form$/) do
  sign_in_user(@user.user_name, @user.password)
end

Then(/^I see that I become logged in user$/) do
  expect(@home_page.menu.logged_as.text).to include "Logged in as #{@user.user_name}"
end

And(/^I fill in registration form$/) do
  @user = User.new
  sign_up_user(@user)
end
