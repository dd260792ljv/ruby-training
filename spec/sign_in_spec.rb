# frozen_string_literal: true

feature 'Sign in user', js: true do
  before(:each) do
    @home_page = HomePage.new
    @home_page.load
    expect(@home_page.header.text).to include 'Redmine@testautomate.me'

    @user = User.new
    api_create_user(@user)
  end

  scenario 'User can log in' do
    @home_page.menu.sigh_in_link.click

    sign_in_user(@user.user_name, @user.password)

    expect(@home_page.menu.logged_as.text).to include "Logged in as #{@user.user_name}"
  end
end
