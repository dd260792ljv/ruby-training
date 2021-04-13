# frozen_string_literal: true

require 'ffaker'
require 'yaml'

# This Class describes user object
class User
  attr_reader :user_name, :password, :email, :first_name, :last_name

  def initialize
    random = Time.now.to_i.to_s

    @user_name = "test#{random}"
    @password = FFaker::Internet.password
    @email = FFaker::Internet.email
    @first_name = FFaker::Name.first_name
    @last_name = FFaker::Name.last_name
  end

  def save_to_file(file)
    credentials = { user_name: user_name, password: password, email: email, first_name: first_name,
                    last_name: last_name }
    File.open(file, 'w') { |f| f.write(credentials.to_yaml) }
  end

  def read_from_file(file)
    YAML.safe_load(File.read(file), [Symbol])
  end
end
