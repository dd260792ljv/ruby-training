# frozen_string_literal: true

require 'yaml'

class User
  attr_reader :user_name, :password, :email, :first_name, :last_name

  def initialize
    random = Time.now.to_i.to_s

    @user_name = "test#{random}"
    @password = 'test1234'
    @email = "#{user_name}@test.org"
    @first_name = 'Test'
    @last_name = 'User'
  end

  def save_to_file(file)
    credentials = { user_name: user_name, password: password, email: email, first_name: first_name,
                    last_name: last_name }
    File.open(file, 'w') { |f| f.write(credentials.to_yaml) }
  end

  def read_from_file(file)
    YAML.safe_load(File.read(file))
  end
end
