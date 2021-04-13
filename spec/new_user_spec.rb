# frozen_string_literal: true

feature 'New user', js: true do
  before(:each) do
    @user = User.new
    @home_page = HomePage.new
    @home_page.load
    expect(@home_page.header.text).to include 'Redmine@testautomate.me'
  end

  scenario 'Register new user' do
    @home_page.menu.sigh_up_link.click

    sign_up_user(@user)

    @my_page = MyPage.new

    @my_page.menu.my_page_link.click

    expect(@my_page.title.text).to include 'My page'
    expect(@my_page.current_url).to include('my/page')
    expect(@my_page.assigned_issues.text).to include('0')
    expect(@my_page.reported_issues.text).to include('0')
  end
end
