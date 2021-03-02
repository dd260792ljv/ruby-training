feature 'Authentication user', js: true do

  user_name = 'test' + Time.now.to_i.to_s
  password = 'test1234'
  credentials = {user_name: user_name, password: password}
  File.open('./spec/data/credentials.txt', 'w') { |file| file.write(credentials.to_json) }

  after(:all) { File.delete('./spec/data/credentials.txt') }

  scenario 'User can register' do
    visit('http://testautomate.me/redmine')
    expect(page).to have_content('Redmine@testautomate.me')

    find('.register').click

    find('#user_login').set user_name
    find('#user_password').set password
    find('#user_password_confirmation').set password
    find('#user_firstname').set 'Test'
    find('#user_lastname').set 'User'
    find('#user_mail').set "#{user_name}@test.org"
    find('#new_user > input[type=submit]:nth-child(4)').click

    expect(page).to have_content "Logged in as #{user_name}"
  end

  scenario 'User can log in' do
    credentials = JSON.parse(File.read('./spec/data/credentials.txt'))

    visit('http://testautomate.me/redmine')
    expect(page).to have_content('Redmine@testautomate.me')

    find('.login').click

    find('#username').set credentials['user_name']
    find('#password').set credentials['password']
    find('#login-submit').click

    expect(page).to have_content "Logged in as #{user_name}"
  end
end
