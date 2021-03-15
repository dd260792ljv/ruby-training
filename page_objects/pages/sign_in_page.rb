# frozen_string_literal: true

class SignInPage < SitePrism::Page
  element :username, '#username'
  element :password, '#password'
  element :login_btn, '#login-submit'
end
