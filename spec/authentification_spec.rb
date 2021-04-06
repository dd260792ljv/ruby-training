# frozen_string_literal: true

feature 'Authentication user', js: true do
  before(:all) do
    @file = './spec/data/credentials.yaml'
    @user = User.new
    @user.save_to_file(@file)
  end

  before(:each) do
    @home_page = HomePage.new
    @home_page.load
  end

  after(:all) { File.delete(@file) }

  scenario 'User can register' do
    expect(@home_page.header.text).to include 'Redmine@testautomate.me'

    @home_page.menu.sigh_up_link.click

    sign_up_user(@user)

    expect(@home_page.menu.logged_as.text).to include "Logged in as #{@user.user_name}"
  end

  scenario 'User can log in' do
    credentials = @user.read_from_file(@file)

    expect(@home_page.header.text).to include 'Redmine@testautomate.me'

    @home_page.menu.sigh_in_link.click

    sign_in_user(credentials[:user_name], credentials[:password])

    expect(@home_page.menu.logged_as.text).to include "Logged in as #{credentials[:user_name]}"
  end
end
