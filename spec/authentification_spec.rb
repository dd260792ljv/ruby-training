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

    @sign_up_page = SignUpPage.new

    @sign_up_page.login.set @user.user_name
    @sign_up_page.password.set @user.password
    @sign_up_page.password_confirm.set @user.password
    @sign_up_page.firstname.set @user.first_name
    @sign_up_page.lastname.set @user.last_name
    @sign_up_page.email.set @user.email
    @sign_up_page.submit_btn.click

    expect(@home_page.menu.logged_as.text).to include "Logged in as #{@user.user_name}"
  end

  scenario 'User can log in' do
    credentials = @user.read_from_file(@file)

    expect(@home_page.header.text).to include 'Redmine@testautomate.me'

    @home_page.menu.sigh_in_link.click

    @sign_in_page = SignInPage.new

    @sign_in_page.username.set credentials[:user_name]
    @sign_in_page.password.set credentials[:password]
    @sign_in_page.login_btn.click

    expect(@home_page.menu.logged_as.text).to include "Logged in as #{credentials[:user_name]}"
  end
end
