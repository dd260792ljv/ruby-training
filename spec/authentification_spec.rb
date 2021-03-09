feature 'Authentication user', js: true do

  random = Time.now.to_i.to_s
  user_name = 'test' + random
  password = 'test1234'
  credentials = {user_name: user_name, password: password}
  File.open('./spec/data/credentials.json', 'w') { |file| file.write(credentials.to_json) }

  before(:each) do
    @home_page = HomePage.new
    @home_page.load
  end

  after(:all) { File.delete('./spec/data/credentials.json') }

  scenario 'User can register' do
    expect(@home_page.header.text).to include 'Redmine@testautomate.me'

    @home_page.menu.sigh_up_link.click

    @sign_up_page = SignUpPage.new

    @sign_up_page.login.set user_name
    @sign_up_page.password.set password
    @sign_up_page.password_confirm.set password
    @sign_up_page.firstname.set 'Test'
    @sign_up_page.lastname.set 'User'
    @sign_up_page.email.set "#{user_name}@test.org"
    @sign_up_page.submit_btn.click

    expect(@home_page.menu.logged_as.text).to include "Logged in as #{user_name}"
  end

  scenario 'User can log in' do
    credentials = JSON.parse(File.read('./spec/data/credentials.json'))

    expect(@home_page.header.text).to include 'Redmine@testautomate.me'

    @home_page.menu.sigh_in_link.click

    @sign_in_page = SignInPage.new

    @sign_in_page.username.set credentials['user_name']
    @sign_in_page.password.set credentials['password']
    @sign_in_page.login_btn.click

    expect(@home_page.menu.logged_as.text).to include "Logged in as #{user_name}"
  end
end
